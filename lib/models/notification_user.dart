import 'package:findme_gp_project/models/user.dart';

class NotificationUser {
  final User user; 
  final String smallDescription;
  final int postId;
  final String date;
  //TODO
  //date should be DateTime.

  NotificationUser({this.user, this.smallDescription, this.postId, this.date});
}
