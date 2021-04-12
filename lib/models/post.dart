import 'package:findme_gp_project/models/user.dart';
import 'package:flutter/cupertino.dart';

class Post {
  final User user;
  final String infoPost;
  final DateTime date;
  final List listImages;
  Post(
    this.user,
    this.infoPost,
    this.date,
    this.listImages,
  );
}
