import 'package:flutter/material.dart';

class PostItem extends StatefulWidget {
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: CircleAvatar(radius: 35),
              title: Text('Moaaz Hasan'),
              subtitle: Text(' 4:15 pm'),
            ),
            TextField(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: Row(
                      children: [
                        Icon(Icons.call),
                        Text('Call'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Row(
                      children: [
                        Icon(Icons.message),
                        Text('Message'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        Text('Get Location'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  // TextButton(
                  //   child: Row(
                  //     children: [
                  //       Text('Who see This?'),
                  //     ],
                  //   ),
                  //   onPressed: () {},
                  // ),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
