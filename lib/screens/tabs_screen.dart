import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/screens/home_screen.dart';
import 'package:findme_gp_project/screens/sign_in.dart';
import 'package:findme_gp_project/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'chats_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class TabsScreen extends StatefulWidget {
  // List<Meal> favoriteMeals;
  // TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home',
      },
      {
        'page': NotificationScreen(),
        'title': 'Notifications',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        leading: Image.asset('assets/images/new_logo.png'),
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(7),
              child: ProfileAvatar(
                imageUrl:
                    context.read<UserProvider>().currentUser.profilePicture,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            },
          ),
          IconButton(
              icon: Icon(FontAwesomeIcons.signOutAlt),
              iconSize: 30,
              color: Colors.white,
              tooltip: "Logout",
              onPressed: () async {
                await context.read<UserProvider>().logout();

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              }),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellowAccent,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bell), label: "Notifications")
          ]),
    );
  }
}
