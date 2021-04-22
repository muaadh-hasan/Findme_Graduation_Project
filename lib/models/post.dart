import 'package:findme_gp_project/models/user.dart';
import 'package:geolocator/geolocator.dart';

class Post {
  final User user;
  final String infoPost;
  final DateTime date;
  final List listImages;
  Position position;
  //TODO
  //There are two locations:
  //1- the location of the post itself which the user will put it manually.
  //2- the last location of the user who posted the post.
  //which location we will put it in the post ??
  Post({this.user, this.infoPost, this.date, this.listImages});
}
