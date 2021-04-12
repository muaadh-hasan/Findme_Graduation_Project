import 'package:findme_gp_project/models/user.dart';

class Message {
  final User user;
  final DateTime date;
  final String text;
  final bool unread;

  Message({this.user, this.date, this.text, this.unread});
}
