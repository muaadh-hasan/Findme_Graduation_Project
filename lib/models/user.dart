import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/request.dart';

// FindMe.GP2021
class User {
  final String username;
  final String password;
  final String phone;
  final String location;
  final String type;
  final String email;
  final String profilePicture;
  final List<Post> posts;
  final List<NotificationUser> notifications;
  // final List<Chat> chats;
  final List<User> relatives;
  final List<Request> requests;

  User({
    this.username,
    this.password,
    this.phone,
    this.location,
    this.type,
    this.email,
    this.profilePicture,
    this.posts,
    this.notifications,
    // this.chats,
    this.relatives,
    this.requests,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
      phone: json['phone'],
      location: json['location'],
      type: json['type'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      posts: json['posts'],
      notifications: json['notifications'],
      // chats: json['phone'],
      relatives: json['relatives'],
      requests: json['requests'],
    );
  }
  factory User.fromJsonForSearch(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      profilePicture: json['profile_picture'],
      location: json['location'],
      phone: json['phone'],
    );
  }
}
