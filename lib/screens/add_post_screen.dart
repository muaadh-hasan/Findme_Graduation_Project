import 'package:findme_gp_project/widgets/create_post_container.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class AddPostScreen extends StatefulWidget {
  @override
  _AddPostScreen createState() => _AddPostScreen();
}

class _AddPostScreen extends State<AddPostScreen> {
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
      ),
      body: ListView(children: [
        // child:
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        child: Center(
                            child: Text('Add Post',
                                style: TextStyle(
                                  fontSize: 40,
                                ))),
                      ),
                    ),
                    Divider(height: 2),
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                        child: Container(
                          color: Colors.white,
                        )),
                    CreatePostContainer(currentUser: currentUser),
                    SizedBox(
                        height: 250,
                        child: Container(
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
