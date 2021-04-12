import 'package:findme_gp_project/models/chat.dart';
import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/request.dart';
import 'package:findme_gp_project/models/account.dart';

class User {
  final Account account;
  final List<Post> posts;
  final List<NotificationUser> notifications;
  final List<Chat> chats;
  final List<User> relatives;
  final List<Request> requests;
  User({
    this.account,
    this.posts,
    this.notifications,
    this.chats,
    this.relatives,
    this.requests,
  });
}
