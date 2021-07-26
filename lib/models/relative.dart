import 'package:findme_gp_project/models/user.dart';
import 'package:flutter/foundation.dart';

class Relative {
  // final User sender;
  // final User reciver;
  final String profilePicture;
  final int userId;
  final String username;

  Relative({this.profilePicture, this.userId, this.username});

  factory Relative.fromJson(Map<String, dynamic> json) {
    return Relative(
      userId: json['user_id'],
      username: json['user_name'],
      profilePicture: json['profile_picture'],
    );
  }
}
