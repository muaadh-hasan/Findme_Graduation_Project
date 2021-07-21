import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class PostItem extends StatefulWidget {
  Post post;
  PostItem(this.post);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  TextEditingController postInfo = TextEditingController();

  List<String> postImages = [
    'https://th.bing.com/th/id/R9516c9859ea32406e2ff8560bb085919?rik=BtsEc5%2b79tQiBA&riu=http%3a%2f%2fwww.hdwallpapers.in%2fdownload%2fcute_kittens-2560x1600.jpg&ehk=qEj3I0ukvZ4d90k7AAKkeWPegTTHeCHNGkeixT7JbHY%3d&risl=&pid=ImgRaw',
    'https://th.bing.com/th/id/OIP.om0Mv8Vg7kDoMJvA3m7ILwHaEo?pid=ImgDet&w=600&h=375&rs=1',
    'https://th.bing.com/th/id/R9516c9859ea32406e2ff8560bb085919?rik=BtsEc5%2b79tQiBA&riu=http%3a%2f%2fwww.hdwallpapers.in%2fdownload%2fcute_kittens-2560x1600.jpg&ehk=qEj3I0ukvZ4d90k7AAKkeWPegTTHeCHNGkeixT7JbHY%3d&risl=&pid=ImgRaw',
    'https://th.bing.com/th/id/OIP.om0Mv8Vg7kDoMJvA3m7ILwHaEo?pid=ImgDet&w=600&h=375&rs=1'
  ];

  // final Function deleteImage;

  // _PostItemState(this.deleteImage);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: ProfileAvatar(
              imageUrl:
                  'https://avatars.githubusercontent.com/u/36192122?s=400&u=1dfc7f24e3963182b2f70df53209d4d9b086479c&v=4',
            ),
            title: Text('Moaaz Hasan'),
            subtitle: Text('4:12 pm'),
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
            child: GridView.builder(
              itemCount: postImages.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  child: Image.network(
                    postImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            height: 45,
            child: InkWell(
              onTap: () => print('Delete'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                height: 25.0,
                child: GestureDetector(
                  onTap: () async {
                    bool check = await context.read<UserProvider>().signIn();
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
