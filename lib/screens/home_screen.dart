import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/widgets/post_item.dart';
import 'package:findme_gp_project/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        leading: Image.asset('assets/images/logo.png'),
        title: Text(
          "Find Me",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          // Expanded(
          //   child: DropdownButton(
          //     icon: Icon(
          //       FontAwesomeIcons.bell,
          //       color: Colors.white,
          //     ),
          //     underline: SizedBox(),
          //     items: currentUser.notifications
          //         .map<DropdownMenuItem<NotificationUser>>(
          //             (notfy) => DropdownMenuItem(
          //                   value: notfy,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                     children: <Widget>[
          //                       Text(notfy.smallDescription,
          //                           style: TextStyle(
          //                               fontSize: 20,
          //                               // fontFamily: "Orbitron",
          //                               fontFamily: "Caveat")),
          //                     ],
          //                   ),
          //                 ))
          //         .toList(),
          //     onTap: () {},
          //     // onChanged: () {
          //     // changeLanguage(language);
          //     // },
          //   ),
          // ),
          IconButton(
              icon: Icon(FontAwesomeIcons.bell),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {}),
          IconButton(
              icon: Icon(FontAwesomeIcons.comment),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {}),
          Container(
            padding: EdgeInsets.all(7),
            child: ProfileAvatar(
              imageUrl:
                  'https://avatars.githubusercontent.com/u/36192122?s=400&u=1dfc7f24e3963182b2f70df53209d4d9b086479c&v=4',
            ),
          ),
        ],
      ),
      body: ListView(
        // child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Hi Moaaz',
                                style: TextStyle(
                                  fontSize: 40,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text('Welcome Back !',
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                            )
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add, size: 18),
                          label: Text("ADD POST"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 653,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return PostItem(currentUser.posts[index]);
                    },
                    itemCount: currentUser.posts.length,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
