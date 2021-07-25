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

  List<String> listImage = [
    'https://i.pinimg.com/originals/a4/29/43/a429434677cef377bb62384a47fc83be.jpg',
    'https://i2-prod.chroniclelive.co.uk/incoming/article13136591.ece/ALTERNATES/s810/fake-twitter-image-london-attack.jpg'
  ];

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
              imageUrl:
                  'https://avatars.githubusercontent.com/u/36192122?s=400&u=1dfc7f24e3963182b2f70df53209d4d9b086479c&v=4',
            ),
            title: Text(name),
            subtitle: Text(widget.post.date.split(' ')[0]),
            // trailing: InkWell(
            //   child: Icon(Icons.delete_outline, color: Colors.blue),
            //   onTap: deleteImage,
            // ),
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
                // bool check = await context
                //     .read<UserProvider>()
                //     .deletePost(widget.post.infoPost);

                // if (check == true) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text("Delete successfully!")));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text("Error!!!, Try again.")));
                // }
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
