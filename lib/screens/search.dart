import 'package:findme_gp_project/models/message.dart';
import 'package:findme_gp_project/models/user.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../data.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<User> _usersForDisplay;
  final GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _usersForDisplay = context.read<UserProvider>().usersSearchList;
    // for (var item in _usersForDisplay) {
    //   print(item.name);
    //   // print("*****\n");
    // }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            searchBar(),
            SizedBox(
              height: 15,
            ),
            InkWell(
              child: button(mainColor, "Search", context),
              onTap: () {
                context.read<UserProvider>().searchUser(_searchController.text);
              },
            ),
            _usersForDisplay == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(child: Text("No name of user to search!")),
                  )
                : Expanded(
                    child: Container(
                      height: 600,
                      child: ListView.builder(
                        itemCount: _usersForDisplay.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: relativeRequest(context, index),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  searchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
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
                controller: _searchController,
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
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget relativeRequest(BuildContext context, int index) {
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
          Expanded(
            flex: 3,
            child: Row(
              children: [
                profileImage(context, _usersForDisplay[index].profilePicture),
                SizedBox(width: 10),
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
              ],
            ),
          ),
          SizedBox(width: 2),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  child: button(Colors.green, "Add", context),
                  onTap: () async {
                    bool check = await context
                        .read<UserProvider>()
                        .addRelative(_usersForDisplay[index].userId);

                    print("****** Add Relative");
                    print(check);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(context.read<UserProvider>().message)));
                  },
                ),
              )),
        ],
      ),
    );
  }
}
