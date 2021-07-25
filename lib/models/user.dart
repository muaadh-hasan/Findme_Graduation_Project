import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/relative.dart';

// FindMe.GP2021
class User {
  final int userId;
  final String username;
  final String password;
  final String phone;
  final String location;
  final String type;
  final String email;
  final String profilePicture;
  final List<Post> posts;
  final List<NotificationUser> notifications;
  final List<Relative> relatives;
  final List<Relative> requests;

  User({
    this.userId,
    this.username,
    this.password,
    this.phone,
    this.location,
    this.type,
    this.email,
    this.profilePicture,
    this.posts,
    this.notifications,
    this.relatives,
    this.requests,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    List<Post> _posts;
    List<NotificationUser> _notifications;
    List<Relative> _relatives;
    List<Relative> _requests;

    if (json['posts'] != null) {
      var objsJson = json['posts'] as List;
      _posts = objsJson.map((postJson) => Post.fromJson(postJson)).toList();
    } else {
      _posts = [];
    }

    if (json['notfications'] != null) {
      var objsJson = json['notfications'] as List;
      _notifications = objsJson
          .map((objsJson) => NotificationUser.fromJson(objsJson))
          .toList();
    } else {
      _notifications = [];
    }

    if (json['relatives'] != null) {
      var objsJson = json['relatives'] as List;
      _relatives =
          objsJson.map((objsJson) => Relative.fromJson(objsJson)).toList();
    } else {
      _relatives = [];
    }

    if (json['requests'] != null) {
      var objsJson = json['requests'] as List;
      _requests =
          objsJson.map((objsJson) => Relative.fromJson(objsJson)).toList();
    } else {
      _requests = [];
    }

    return User(
      userId: json['user_id'],
      username: json['user_name'],
      password: json['password'],
      phone: json['phone'],
      location: json['location'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      posts: _posts,
      notifications: _notifications,
      relatives: _relatives,
      requests: _requests,
    );
  }

  factory User.fromJsonForSearch(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['user_name'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      location: json['location'],
      phone: json['phone'],
    );
  }

  // factory User.fromJsonForSearchList(Map<String, dynamic> json) {
  //   List<User> usersList;

  //   if (json['users'] != null) {
  //     var objsJson = json['users'] as List;
  //     usersList =
  //         objsJson.map((objsJson) => User.fromJsonForSearch(objsJson)).toList();
  //   } else {
  //     usersList = [];
  //   }

  //   return usersList;
  // }
}
