import 'package:findme_gp_project/models/user.dart';

class Request {
  final User sender;
  final User reciever;
  final bool accepted ;

  Request({this.sender, this.reciever, this.accepted = false});
}
