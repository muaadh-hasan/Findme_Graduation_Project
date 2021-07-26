import 'dart:io';

import 'package:findme_gp_project/models/post.dart';
import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreatePostContainer extends StatefulWidget {
  final User currentUser;

  const CreatePostContainer({
    @required this.currentUser,
  });

  @override
  _CreatePostContainerState createState() => _CreatePostContainerState();
}

class _CreatePostContainerState extends State<CreatePostContainer> {
  List<String> postTypes = ["Choose!", "Seeker", "Founder"];
  List<String> statesFinder = ["Choose!", "In hand", "Kidnapped"];
  var postTypeSelected;
  var stateFinderSelected;

  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _infoPostController = new TextEditingController();

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
                  child: Form(
                    key: _formKey,
                    child: TextField(
                      controller: _infoPostController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.insert_drive_file_outlined,
                            color: Colors.grey),
                        hintText: 'What\'s happened?',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      maxLines: 10,
                      // onTap: () {
                      //   print('Post');
                      // },
                    ),
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
                      onPressed: () {
                        showChooseImageWindow(context);
                      },
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
              onPressed: () async {
                if (context.read<UserProvider>().tempImage != null) {
                  bool check = await context
                      .read<UserProvider>()
                      .uploadImageToFirebase(
                          context, context.read<UserProvider>().tempImage);

                  if (check == true) {
                    Post post = Post(
                        infoPost: _infoPostController.text,
                        // image: context.watch<UserProvider>().imagePost,
                        state: stateFinderSelected,
                        postType: postTypeSelected,
                        location: "Cairo");
                    bool checkPost =
                        await context.read<UserProvider>().addPost(post);
                    if (checkPost == true) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(context.read<UserProvider>().message)));
                    }
                    print('checkPost');
                    print(checkPost);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("please upload photo first!")));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Error in uploading photo!, try again.")));
                }
              },
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

  Builder buildDialogItem(
      BuildContext context, String text, IconData icon, ImageSource src) {
    return Builder(
      builder: (innerContext) => Container(
        decoration: BoxDecoration(
          color: const Color(0xff60aad2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(text),
          onTap: () async {
            File image = await context.read<UserProvider>().getImage(src);
            context.read<UserProvider>().tempImage = image;
            Navigator.of(innerContext).pop();
          },
        ),
      ),
    );
  }

  void showChooseImageWindow(BuildContext context) {
    var ad = AlertDialog(
      title: Text("Choose Picture from:"),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Divider(color: Colors.black),
            buildDialogItem(context, "Camera", Icons.add_a_photo_outlined,
                ImageSource.camera),
            SizedBox(height: 10),
            buildDialogItem(
                context, "Gallery", Icons.image_outlined, ImageSource.gallery),
          ],
        ),
      ),
    );
    showDialog(builder: (context) => ad, context: context);
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
      onChanged: (T_S == 'state' && postTypeSelected == 'Seeker')
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
