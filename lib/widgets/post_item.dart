import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PostItem extends StatefulWidget {
  Post post;
  PostItem(this.post);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  TextEditingController postInfo = TextEditingController();

  // final Function deleteImage;

  // _PostItemState(this.deleteImage);

  bool flag = false;

  @override
  Widget build(BuildContext context) {
    print("IMMMMAAAAGGGGEEEEE!!!!");
    print(widget.post.image);
    String name = context.read<UserProvider>().currentUser.username;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: ProfileAvatar(
              imageUrl: context.read<UserProvider>().currentUser.profilePicture,
            ),
            title: Text(name),
            subtitle: Text(widget.post.date.split(' ')[0]),
          ),
          Divider(),
          Text(widget.post.infoPost),
          SizedBox(height: 10),
          Container(
              height: 150,
              child: Image(
                image: NetworkImage(widget.post.image),
              )),
          Divider(),
          Container(
            height: 45,
            child: InkWell(
              onTap: () async {
                print(context.read<UserProvider>().currentUser.posts);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 25.0,
                child: InkWell(
                  onTap: () async {
                    await context
                        .read<UserProvider>()
                        .deletePost(widget.post.postId);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(context.read<UserProvider>().message)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.trash, color: Colors.blue),
                      const SizedBox(width: 4.0),
                      Text("Delete Post"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _PostButton extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final Function onTap;

//   const _PostButton({
//     Key key,
//     @required this.icon,
//     @required this.label,
//     @required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         color: Colors.white,
//         child: InkWell(
//           onTap: onTap,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             height: 25.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 icon,
//                 const SizedBox(width: 4.0),
//                 Text(label),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
