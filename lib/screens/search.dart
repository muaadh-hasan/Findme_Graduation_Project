import 'package:findme_gp_project/models/message.dart';
import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<User> _usersForDisplay;
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _SearchController = new TextEditingController();

  @override
  void initState() {
    _usersForDisplay = context.watch<UserProvider>().UsersSearch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // for (var item in _usersForDisplay) {
    //   print(item.name);
    //   // print("*****\n");
    // }
    return Scaffold(
      body: ListView.builder(
        itemCount: _usersForDisplay.length + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? searchBar()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: relativeRequest(context, index - 1),
                );
        },
      ),
    );
  }

  searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff60aad2),
              offset: Offset(0.0, 3.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * .80,
        height: MediaQuery.of(context).size.height * .060,
        child: Padding(
          padding: const EdgeInsets.all(0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _SearchController,
                decoration: InputDecoration(
                  hintText: "Search...",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 17.5,
                  color: const Color(0xff60aad2),
                  letterSpacing: 1.05,
                  //  height: 1.542857142857143,
                ),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    // _usersForDisplay = users.where((user) {
                    //   var userItem = user.email.toLowerCase();
                    //   return userItem.startsWith(text);
                    // }).toList();
                    context.read<UserProvider>().searchUser(text);
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget relativeRequest(BuildContext context, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color.fromARGB(18, 0, 160, 246),
      ),
      width: MediaQuery.of(context).size.width * .90,
      height: MediaQuery.of(context).size.height * .060,
      margin: EdgeInsets.only(
        //  top: !isLandScape ? MediaQuery.of(context).size.height* .28
        // : MediaQuery.of(context).size.height* .55,
        left: MediaQuery.of(context).devicePixelRatio * 10,
      ),
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          profileImage(context),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              _usersForDisplay[index].username,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15.5,
                color: Colors.grey[700],
                //letterSpacing: 1.05,
                //  height: 1.542857142857143,
              ),

              //textAlign: TextAlign.left,
            ),
          ),
          SizedBox(width: 2),
          button(Colors.green, "Add", context),
        ],
      ),
    );
  }
}
