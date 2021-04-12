import 'package:findme_gp_project/models/user.dart';

class Message {
  final User user;
  final DateTime date;
  final String text;

  Message(this.user, this.date, this.text);
}
