import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/screens/add_post_screen.dart';
import 'package:findme_gp_project/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
      body: ListView(
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
                            Text(
                                'Hi ' +
                                    context
                                        .read<UserProvider>()
                                        .currentUser
                                        .username,
                                style: TextStyle(
                                  fontSize: 25,
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
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AddPostScreen();
                            }));
                          },
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
                      return PostItem(context
                          .read<UserProvider>()
                          .currentUser
                          .posts[index]);
                    },
                    itemCount:
                        context.read<UserProvider>().currentUser.posts.length,
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
