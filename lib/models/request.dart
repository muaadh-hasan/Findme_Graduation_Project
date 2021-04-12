import 'package:findme_gp_project/models/user.dart';

class Request {
  final User sender;
  final User reciver;

  Request(this.sender, this.reciver);
}
