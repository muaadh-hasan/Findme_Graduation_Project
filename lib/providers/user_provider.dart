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

  List<File> imagesList = [];
  File image;

  User currentUser;

  Future<void> logout() async {
    currentUser = null;

    notifyListeners();

    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<bool> signUp(
      String email, String password, String name, String phone) async {
    // try {
    //   final responce = await http.post(Uri.parse(mainUrl),
    //       body: json.encode({
    //         'email': email,
    //         'password': password,
    //         'name': name,
    //         'phone': phone
    //       }));

    //   final responceData = json.decode(responce.body);

    //   print(responceData);
    //   // if (responceData['error'] != null) {
    //   //   throw HttpException(responceData['error']['message']);
    //   // }

    //   // if(responceData.hashCode == 200){

    //   // }else{}

    //   currentUser = responceData['user'];

    //   notifyListeners();

    //   final prefs = await SharedPreferences.getInstance();

    //   final userData = json.encode({
    //     'currentUser': currentUser,
    //   });

    //   prefs.setString('userData', userData);

    //   print('check' + userData.toString());
    // } catch (e) {
    //   return false;
    // }
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    // try {
    //   final responce = await http.post(Uri.parse(mainUrl),
    //       body: json.encode({'email': email, 'password': password}));

    //   final responceData = json.decode(responce.body);

    //   print(responceData);
    //   // if (responceData['error'] != null) {
    //   //   throw HttpException(responceData['error']['message']);
    //   // }

    //   // if(responceData.hashCode == 200){

    //   // }else{}

    //   currentUser = responceData['user'];

    //   notifyListeners();

    //   final prefs = await SharedPreferences.getInstance();
    //   final userData = json.encode({
    //     'currentUser': currentUser,
    //   });

    //   prefs.setString('userData', userData);

    //   print('check' + userData.toString());
    // } catch (e) {
    //   return false;
    // }
    return true;
  }

  void addImage({File image}) {
    imagesList.add(image);
    notifyListeners();
  }

  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().getImage(source: src);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      imagesList.add(image);
      notifyListeners();
      print('Image selected.');
    } else {
      print('No image selected.');
    }
  }

  void deleteImage() {
    image = null;
  }

  // void addPost(Post post) {
  //   posts.add(post);
  // }

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
