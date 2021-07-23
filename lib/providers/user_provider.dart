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

  List<User> UsersSearch;

  User currentUser;

  Future<bool> logout() async {
    // currentUser = null;

    try {
      final responce = await http.get(Uri.parse(mainUrl + "/myapp/view/"));

      print(responce.body);

      if (responce.statusCode == 200) {
        if (jsonDecode(responce.body)['error'] == false) {
          // message = jsonDecode(responce.body)['msg'];
          print(responce.body);
          print(jsonDecode(responce.body)['error']);
          return false;
        } else {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(responce.body);
          print(jsonDecode(responce.body)['error']);

          // responceData = User.fromJson(jsonDecode(responce.body));

          // currentUser = responceData;
        }
      } else {
        throw Exception('Errrooooorrr!!!!!!');
      }
      notifyListeners();
    } catch (e) {
      return false;
    }

    return true;
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

  void searchUser(String searchWord) async {
    final responce = await http.post(Uri.parse(mainUrl + 'myapp/SearchUser'),
        body: json.encode({"username": searchWord}));
    var responceData;

    if (responce.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      responceData = User.fromJsonForSearch(jsonDecode(responce.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Errrooooorrr!!!!!!');
    }
    notifyListeners();
    UsersSearch = responceData;
  }

  Future<String> editSettings(
      {String email,
      String userName,
      String password,
      String location,
      String phone,
      String image}) async {
    try {
      final responce = await http.post(Uri.parse(mainUrl),
          body: json.encode({
            'email': email,
            'password': password,
            'user_name': userName,
            'location': location,
            'phone': phone,
            'image': image
          }));

      var responceData;

      if (responce.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        responceData = responce.body;
        if (responceData == "true") {}
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to edit data');
      }

      notifyListeners();
    } catch (e) {
      return "false";
    }
    return "true";
  }

  // void addRelative(User relative) {
  //   relatives.add(relative);
  // }

  // void addRequest(Request request) {
  //   requests.add(request);
  // }

  // void addNotification(NotificationUser notificationUser) {
  //   notifications.add(notificationUser);
  // }

}
