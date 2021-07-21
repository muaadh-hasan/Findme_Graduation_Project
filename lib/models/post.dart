import 'dart:html';

import 'package:findme_gp_project/models/user.dart';

class Post {
  final User user;
  final String infoPost;
  final String postType;
  final String state;
  final String location;

  final DateTime date;
  final File image;
  Post(
      {this.location,
      this.postType,
      this.state,
      this.image,
      this.user,
      this.infoPost,
      this.date});
}
