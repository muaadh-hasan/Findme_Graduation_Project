import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    @required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.insert_drive_file_outlined,
                          color: Colors.grey),
                      hintText: 'What\'s happen?',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    maxLines: 10,
                    onTap: () {
                      print('Post');
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40.0,
                    child: TextButton.icon(
                      onPressed: () => showChooseImageWindow(context),
                      icon: Icon(
                        Icons.add_a_photo_sharp,
                        color: Colors.green,
                      ),
                      label: Text('Add Photo'),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ElevatedButton.icon(
              onPressed: () => print('Post'),
              icon: Icon(Icons.add_circle_outline_sharp, size: 30),
              label: Text("Post", style: TextStyle(fontSize: 25)),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
