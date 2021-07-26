import 'dart:convert';
import 'dart:io';

import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/relative.dart';
import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:rest_api_login/utils/http_exception.dart';
import 'package:path/path.dart';

class UserProvider with ChangeNotifier {
  var mainUrl = Api.authUrl;

  String message = "";

  String imageProfile;
  String imagePost;
  File image;
  File tempImage;

  List<User> usersSearchList;

  User currentUser;

  Future<void> logout() async => currentUser = null;

  Future<bool> signUp(
      String email, String password, String name, String phone) async {
    var map = new Map<String, dynamic>();

    map['email'] = email;
    map['password'] = password;
    map['user_name'] = name;
    map['phone'] = phone;

    try {
      final responce =
          await http.post(Uri.parse(mainUrl + "/myapp/SignUp/"), body: map);

      var responceData;

      if (responce.statusCode == 200) {
        if (jsonDecode(responce.body)['error'] == true) {
          message = jsonDecode(responce.body)['msg'];
          return false;
        } else {
          print(responce.body);
          print(jsonDecode(responce.body)['error']);

          responceData = User.fromJson(jsonDecode(responce.body));
          print("**********-------");
          print(responceData.email);

          currentUser = responceData;
        }
      } else {
        throw Exception('Failed to load album');
      }
      notifyListeners();
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    getImageFromFirebase('Moaaz.jpeg');

    // currentUser = null;
    try {
      print("***** Logic Login");
      print(email);
      print(password);
      var map = new Map<String, dynamic>();

      map['email'] = email;
      map['password'] = password;

      final responce =
          await http.post(Uri.parse(mainUrl + "/myapp/LogIn/"), body: map);

      var responceData;

      final responce2 = await http.get(Uri.parse(mainUrl + "/myapp/view/"));

      print("R2");
      print(responce2.body);

      if (responce.statusCode == 200) {
        if (jsonDecode(responce.body)['error'] == true) {
          message = jsonDecode(responce.body)['msg'];
          return false;
        } else {
          print(responce.body);
          print(jsonDecode(responce.body)['error']);

          responceData = User.fromJson(jsonDecode(responce.body));
          print("**********-------");
          print(responceData.email);

          currentUser = responceData;
        }
      } else {
        throw Exception('Errrooooorrr!!!!!!');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  void addImageProfile(String image) {
    this.imageProfile = image;
    notifyListeners();
  }

  Future<File> getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().getImage(source: src);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      // imagesList.add(image);
      notifyListeners();
      print('Image selected.');
    } else {
      print('No image selected.');
    }
    return image == null ? null : image;
  }

  void deleteImage() {
    image = null;
  }

  Future<bool> deletePost(int id) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['post_id'] = id.toString();

    final responce =
        await http.post(Uri.parse(mainUrl + '/myapp/DeletePost/'), body: map);

    notifyListeners();

    if (responce.statusCode == 200) {
      if (jsonDecode(responce.body)['error'] == false) {
        message = jsonDecode(responce.body)['msg'];
        return false;
      } else {
        print(responce.body);
        print(jsonDecode(responce.body)['error']);
      }
    } else {
      throw Exception('Errrooooorrr!!!!!!');
    }
    return true;
  }

  Future<bool> addPost(Post post) async {
    var map = new Map<String, dynamic>();

    print('AddPost ****************************');

    map['user_id'] = currentUser.userId.toString();
    map['description'] = post.infoPost;
    map['type'] = post.postType;
    map['case'] = post.state;
    map['image'] = imagePost;
    map['location'] = post.location;

    print(post);

    try {
      final responce =
          await http.post(Uri.parse(mainUrl + '/myapp/AddPost/'), body: map);

      if (responce.statusCode == 200) {
        message = jsonDecode(responce.body)['msg'];
        print(message);
      } else {
        throw Exception('Failed to add post, try again');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> searchUser(String searchWord) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['username'] = searchWord;

    final responce =
        await http.post(Uri.parse(mainUrl + '/myapp/SearchUser/'), body: map);
    var responceData;

    if (responce.statusCode == 200) {
      if (jsonDecode(responce.body)['error'] == true) {
        // message = jsonDecode(responce.body)['msg'];
        return false;
      } else {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        print(responce.body);
        print(jsonDecode(responce.body)['error']);

        responceData = jsonDecode(responce.body);

        // List<User> usersList;

        if (responceData['users'] != null) {
          var objsJson = responceData['users'] as List;
          usersSearchList = objsJson
              .map((objsJson) => User.fromJsonForSearch(objsJson))
              .toList();
        } else {
          usersSearchList = [];
        }
        print("usersSearchList.length ******");
        print(usersSearchList.length);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Errrooooorrr!!!!!!');
    }
    notifyListeners();
    return true;
  }

  Future<bool> editSettings(
      {String email,
      String userName,
      String password,
      String location,
      String phone,
      String image}) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['user_name'] = userName;
    map['password'] = password;
    map['location'] = location;
    map['phone'] = phone;
    map['image_profile'] = 'No yett';

    try {
      final responce = await http
          .post(Uri.parse(mainUrl + '/myapp/EditProfile/'), body: map);

      var responceData;

      if (responce.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        responceData = responce.body;
        // if (responceData == "true") {}
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to edit data');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> confirmRequest(int relativeId) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['sender_id'] = relativeId.toString();

    try {
      final responce = await http
          .post(Uri.parse(mainUrl + '/myapp/ConfirmRequest/'), body: map);

      if (responce.statusCode == 200) {
        message = jsonDecode(responce.body)['msg'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to confirm this user, try again');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> deleteRequest(int relativeId) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['sender_id'] = relativeId.toString();

    try {
      final responce = await http
          .post(Uri.parse(mainUrl + '/myapp/DeleteRequest/'), body: map);

      if (responce.statusCode == 200) {
        message = jsonDecode(responce.body)['msg'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('error!!!!');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> deleteRelative(int relativeId) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['relative_id'] = relativeId.toString();

    try {
      final responce = await http
          .post(Uri.parse(mainUrl + '/myapp/DeleteRelative/'), body: map);

      if (responce.statusCode == 200) {
        message = jsonDecode(responce.body)['msg'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('error!!!!');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> addRelative(int relativeId) async {
    var map = new Map<String, dynamic>();

    map['user_id'] = currentUser.userId.toString();
    map['add_user_id'] = relativeId.toString();

    print('add_user_id');
    print(relativeId);

    try {
      final responce =
          await http.post(Uri.parse(mainUrl + '/myapp/AddUser/'), body: map);

      if (responce.statusCode == 200) {
        message = jsonDecode(responce.body)['msg'];
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to confirm this user, try again');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  uploadPic(File _image1, String name) async {
    // Firebase.initializeApp();
    // FirebaseStorage storage = FirebaseStorage.instance;
    // String url;
    // String imageName = name + "_" + DateTime.now().toString();
    // Reference ref = storage.ref().child(imageName);
    // UploadTask uploadTask = ref.putFile(_image1);
    // uploadTask.whenComplete(() {
    //   url = ref.getDownloadURL() as String;
    // }).catchError((onError) {
    //   print(onError);
    // });

    // print("-*-*-*-*-*-*-*-*-*-*-*");
    // print(url);
    // print(imageName);

    // return url;
  }

  Future<bool> uploadImageToFirebase(
      BuildContext context, File imageFile) async {
    try {
      String fileName = basename(imageFile.path);
      print("FileName: **********");
      print(fileName);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('$fileName');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      taskSnapshot.ref.getDownloadURL().then(
            (value) => print("Done: $value"),
          );

      imagePost = fileName;
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<dynamic> getImageFromFirebase(String imageName) async {
//     final ref = FirebaseStorage.instance.ref().child("Moaaz");
// // no need of the file extension, the name will do fine.
//     var url = await ref.getDownloadURL();
//     print(url);
//     return url;

    try {
      // StorageReference ref = FirebaseStorage().ref().child('/missing (1).jpg');
      // String url = (await ref.getDownloadURL()).toString();

      StorageReference ref = FirebaseStorage.instance.ref().child("Moaaz.png");
      String url = (await ref.getDownloadURL()).toString();
      print(url);
      return url;
    } catch (e) {
      print(e);
    }
  }
}//end class

