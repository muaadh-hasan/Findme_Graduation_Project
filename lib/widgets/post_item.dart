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
          ),
          Divider(),
          // _createTextFormFiled('Post', ' What Happen!', postInfo, 5),
          Text(widget.post.infoPost),
          Container(
            height: 150,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 5,
              children: [
                Image.network(
                  'https://th.bing.com/th/id/R9516c9859ea32406e2ff8560bb085919?rik=BtsEc5%2b79tQiBA&riu=http%3a%2f%2fwww.hdwallpapers.in%2fdownload%2fcute_kittens-2560x1600.jpg&ehk=qEj3I0ukvZ4d90k7AAKkeWPegTTHeCHNGkeixT7JbHY%3d&risl=&pid=ImgRaw',
                ),
                Image.network(
                  'https://th.bing.com/th/id/OIP.om0Mv8Vg7kDoMJvA3m7ILwHaEo?pid=ImgDet&w=600&h=375&rs=1',
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            height: 45,
            child: Row(
              children: [
                _PostButton(
                  icon: Icon(
                    FontAwesomeIcons.phoneAlt,
                    color: Colors.blue[600],
                    size: 20.0,
                  ),
                  label: 'Call',
                  onTap: () => print('Like'),
                ),
                _PostButton(
                  icon: Icon(
                    FontAwesomeIcons.comment,
                    color: Colors.blue[600],
                    size: 20.0,
                  ),
                  label: 'Message',
                  onTap: () => print('Comment'),
                ),
                _PostButton(
                  icon: Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    color: Colors.blue[600],
                    size: 25.0,
                  ),
                  label: 'Location',
                  onTap: () => print('Share'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
