import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePostContainer extends StatefulWidget {
  final User currentUser;

  const CreatePostContainer({
    @required this.currentUser,
  });

  @override
  _CreatePostContainerState createState() => _CreatePostContainerState();
}

class _CreatePostContainerState extends State<CreatePostContainer> {
  List<String> postTypes = ["Choose!", "Seeker", "Finder"];
  List<String> statesFinder = ["Choose!", "In hand", "Kidnapped"];
  var postTypeSelected;
  var stateFinderSelected;

  @override
  void initState() {
    postTypeSelected = postTypes[0];
    stateFinderSelected = statesFinder[0];
    super.initState();
  }

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
              height: 120.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Post Type: ",
                            style: TextStyle(fontSize: 17),
                          ),
                          _createDropdownButton(
                              postTypes, postTypeSelected, 'type'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "State: ",
                            style: TextStyle(fontSize: 17),
                          ),
                          _createDropdownButton(
                              statesFinder, stateFinderSelected, 'state'),
                        ],
                      ),
                    ],
                  ),
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

  Widget _createDropdownButton(List<String> list, String selected, String T_S) {
    return DropdownButton<String>(
      dropdownColor: Colors.black,
      items: list.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(color: Colors.blue),
          ),
        );
      }).toList(),
      style: TextStyle(fontFamily: "Caveat", fontSize: 20),
      value: selected,
      onChanged: (T_S == 'state' && postTypeSelected == 'Finder')
          ? null
          : (String select) {
              setState(() {
                if (T_S == 'type') {
                  postTypeSelected = select;
                  // if (postTypeSelected == 'Finder') {
                  //   stateFinderSelected = 'Disabled';
                  // }
                } else {
                  stateFinderSelected = select;
                }
              });
            },
    );
  }
}
