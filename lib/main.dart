import 'package:findme_gp_project/providers/profile_provider.dart';
import 'package:findme_gp_project/screens/chats_screen.dart';
import 'package:findme_gp_project/screens/home_screen.dart';
import 'package:findme_gp_project/screens/individual_chat_screen.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:findme_gp_project/screens/search.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Search();
    //IndividualChatScreen();
    //Profile();
    //ChatsScreen();
  }
}
