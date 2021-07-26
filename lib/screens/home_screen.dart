import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/screens/add_post_screen.dart';
import 'package:findme_gp_project/widgets/post_item.dart';
import 'package:findme_gp_project/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final keyRefresh = GlobalKey<RefreshIndicatorState>();

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
    loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: context.read<UserProvider>().currentUser == null
            ? Center(child: CircularProgressIndicator())
            : RefreshWidget(
                keyRefresh: keyRefresh,
                onRefresh: loadPage,
                child: ListView(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        padding:
                                            const EdgeInsets.only(left: 30),
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
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          context
                                      .read<UserProvider>()
                                      .currentUser
                                      .posts
                                      .length ==
                                  0
                              ? Container(
                                  color: Colors.white,
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                    child: Text(
                                      "There is no Posts yet!",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  height: 653,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return PostItem(context
                                          .read<UserProvider>()
                                          .currentUser
                                          .posts[index]);
                                    },
                                    itemCount: context
                                        .read<UserProvider>()
                                        .currentUser
                                        .posts
                                        .length,
                                    shrinkWrap: true,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                // ),
              ));
  }
}
