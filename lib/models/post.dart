import 'package:findme_gp_project/models/user.dart';

class Post {
  final User user;
  final int postId;
  final String infoPost;
  final String image;
  final String postType;
  final String state;
  final String location;
  final String date;

  Post(
      {this.postId,
      this.location,
      this.postType,
      this.state,
      this.image,
      this.user,
      this.infoPost,
      this.date});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        postId: json['post_id'],
        infoPost: json['description'],
        date: json['datetime'],
        image: json['image_dir']);
  }
}
