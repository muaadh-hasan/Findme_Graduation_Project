import 'dart:io';

import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/request.dart';
import 'package:findme_gp_project/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider with ChangeNotifier {
  List<File> imagesList = [];
  File image;


  List<NotificationUser> notifications;
  List<Post> posts;
  List<User> relatives;
  List<Request> requests;

  void add({File image}) {
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

  void addPost(Post post) {
    posts.add(post);
  }

  void addRelative(User relative) {
    relatives.add(relative);
  }

  void addRequest(Request request) {
    requests.add(request);
  }

  void addNotification(NotificationUser notificationUser) {
    notifications.add(notificationUser);
  }



}
