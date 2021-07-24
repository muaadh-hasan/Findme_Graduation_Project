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
// import 'package:rest_api_login/utils/http_exception.dart';

class UserProvider with ChangeNotifier {
  var mainUrl = Api.authUrl;
  var authKey = Api.authKey;

  String message = "";

  // List<File> imagesList = [];
  File imageProfile;
  File imagePost;
  File image;

  List<User> usersSearchList;

  User currentUser;

  Future<bool> logout() async {
    currentUser = null;
  }

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
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(responce.body);
          print(jsonDecode(responce.body)['error']);

          responceData = User.fromJson(jsonDecode(responce.body));
          print("**********-------");
          print(responceData.email);

          currentUser = responceData;
        }
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
      notifyListeners();

      // final prefs = await SharedPreferences.getInstance();

      // final userData = json.encode({
      //   'currentUser': currentUser,
      // });

      // prefs.setString('userData', userData);

      // print('check' + userData.toString());
    } catch (e) {
      return false;
    }

    return true;
  }

  Future<bool> signIn(String email, String password) async {
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
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(responce.body);
          print(jsonDecode(responce.body)['error']);

          responceData = User.fromJson(jsonDecode(responce.body));
          print("**********-------");
          print(responceData.email);

          currentUser = responceData;
        }
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Errrooooorrr!!!!!!');
      }

      notifyListeners();

      // final prefs = await SharedPreferences.getInstance();

      // final userData = json.encode({
      //   'currentUser': currentUser,
      // });

      // prefs.setString('userData', userData);

      // print('check' + userData.toString());
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  void addImagePost(File image) {
    this.imagePost = image;
    notifyListeners();
  }

  void addImageProfile(File image) {
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

  Future<bool> deletePost(String id) async {
    final responce = await http.post(Uri.parse(mainUrl + '/deletePost'),
        body: json.encode({'id': id}));

    notifyListeners();

    if (responce.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addPost(Post post) async {
    final responce = await http.post(Uri.parse(mainUrl + '/addPost'),
        body: json.encode({
          'infoPost': post.infoPost,
          'postType': post.postType,
          'state': post.state,
          'image': post.image,
        }));
    if (responce.statusCode == 200) {
      return true;
    } else {
      return false;
    }
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

        usersSearchList =
            User.fromJsonForSearch(jsonDecode(responce.body)) as List<User>;
        print("**********-------");
        print(responceData.email);

        currentUser = responceData;
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Errrooooorrr!!!!!!');
    }
    notifyListeners();
    usersSearchList = responceData;
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
}//end class

