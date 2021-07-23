import 'package:findme_gp_project/models/user.dart';

class NotificationUser {
  final int notficationId;
  final User user;
  final String smallDescription;
  final int postId;
  final String date;

  NotificationUser(
      {this.notficationId,
      this.user,
      this.smallDescription,
      this.postId,
      this.date});

  factory NotificationUser.fromJson(Map<String, dynamic> json) {
    return NotificationUser(
      notficationId: json['notfication_id'],
      smallDescription: json['smallDescription'],
      date: json['date'],
    );
  }
}
