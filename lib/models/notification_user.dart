import 'package:findme_gp_project/models/user.dart';

class NotificationUser {
  final User user;
  final String smallDescription;
  final int postId;

  NotificationUser(this.user, this.smallDescription, this.postId);
}
