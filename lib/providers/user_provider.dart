import 'dart:convert';
import 'dart:io';

import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/request.dart';
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

  // List<File> imagesList = [];
  File image;
  File imagePost;

  User currentUser;

  Future<void> logout() async {
    currentUser = null;

    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<bool> signUp(
      String email, String password, String name, String phone) async {
    try {
      final responce = await http.post(Uri.parse(mainUrl),
          body: json.encode({
            'email': email,
            'password': password,
            'name': name,
            'phone': phone
          }));

      var responceData;

      print(responceData);

      if (responce.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        responceData = User.fromJson(jsonDecode(responce.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }

      currentUser = responceData['user'];

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();

      final userData = json.encode({
        'currentUser': currentUser,
      });

      prefs.setString('userData', userData);

      print('check' + userData.toString());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      final responce = await http.post(Uri.parse(mainUrl),
          body: json.encode({'email': email, 'password': password}));

      var responceData;

      if (responce.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        responceData = User.fromJson(jsonDecode(responce.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }

      currentUser = responceData['user'];

      notifyListeners();

      final prefs = await SharedPreferences.getInstance();

      final userData = json.encode({
        'currentUser': currentUser,
      });

      prefs.setString('userData', userData);

      print('check' + userData.toString());
    } catch (e) {
      return false;
    }
    return true;
  }

  void addImagePost(File image) {
    this.imagePost = image;
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
    final responce = await http.post(Uri.parse(mainUrl + '\deletePost'),
        body: json.encode({'id': id}));

    notifyListeners();

    if (responce.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> addPost(Post post) async {
    final responce = await http.post(Uri.parse(mainUrl + '\addPost'),
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
