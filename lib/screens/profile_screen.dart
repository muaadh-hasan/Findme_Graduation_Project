import 'dart:io';

import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/providers/location_provider.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/widgets/refresh_widget.dart';
import 'package:findme_gp_project/widgets/relative_requests_widget.dart';
import 'package:findme_gp_project/widgets/your_photos_widget.dart';
import 'package:findme_gp_project/widgets/your_relatives_widget.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'map_screen.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool isLandScape;

  @override
  Widget build(BuildContext context) {
    final keyRefresh = GlobalKey<RefreshIndicatorState>();

    isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    // File image;

    Future loadPage() async {
      keyRefresh.currentState?.show();
      await Future.delayed(Duration(milliseconds: 4000));

      var email = context.read<UserProvider>().currentUser.email;
      var password = context.read<UserProvider>().currentUser.password;

      // bool check = await context.read<UserProvider>().signIn(email, password);
      // print("check refresh");
      // print(check);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Refreshed successfully!")));

      setState(() {
        context.read<UserProvider>().signIn(email, password);
        // print("check refresh");
        // print(check);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Refreshed successfully!")));
      });
    }

    @override
    void initState() {
      super.initState();
      loadPage();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     showChooseImageWindow(context);
        //   },
        //   child: const Icon(Icons.add),
        //   backgroundColor: const Color(0xff60aad2),
        //   tooltip: "Add Photos",
        // ),
        body: context.read<UserProvider>().currentUser == null
            ? Center(child: CircularProgressIndicator())
            : RefreshWidget(
                keyRefresh: keyRefresh,
                onRefresh: loadPage,
                child: Column(
                  children: [
                    Container(
                      // width: MediaQuery.of(context).devicePixelRatio * 700,
                      decoration: BoxDecoration(
                          color: const Color(0xff60aad2),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )),
                      child: Column(
                        children: [
                          customProfileAppBar(context),
                          headerContents(context),
                          Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: searchContainer(
                                          "Search peaople...", context),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MapScreen()));
                                      },
                                      child: locationIcon(context),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // height: double.infinity,
                      child: ListView(
                        // padding: EdgeInsets.only(top: 0.0),
                        children: [
                          separator("Relative Requests", context),
                          MainRelativeRequests(),
                          separator("Your Relatives", context),
                          YourRelatives(),
                          // separator("Your Photos", context),
                          // YourPhotos(),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
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
          context
              .read<UserProvider>()
              .addImageProfile(image.toString()); // must to edit to file name
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
