import 'package:findme_gp_project/widgets/relative_requests_widget.dart';
import 'package:findme_gp_project/widgets/your_photos_widget.dart';
import 'package:findme_gp_project/widgets/your_relatives_widget.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';

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
    isLandScape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xff60aad2),
        tooltip: "Add Photos",
      ),
      body: Column(
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
                          child: searchContainer(context),
                        )),
                    Expanded(
                      flex: 2,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: locationIcon(context)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // height: double.infinity,
              child: ListView(
                children: [
                  separator("Relative Requests", context),
                  RelativeRequests(),
                  separator("Your Relatives", context),
                  YourRelatives(),
                  separator("Your Photos", context),
                  YourPhotos(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//  GridView.count(
// crossAxisCount: 2,
// padding: EdgeInsets.all(20),
// crossAxisSpacing: 10,
// mainAxisSpacing: 20,
// children: [
//   relative(context),
//   relative(context),
// ]),
