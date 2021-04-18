import 'package:findme_gp_project/providers/profile_provider.dart';
import 'package:findme_gp_project/screens/tabs_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/search.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[400],
        accentColor: Colors.deepPurple[50],
      ),
      title: 'Find Me',
      home: Search(),
      // IndividualChatScreen(),
      // ChatsScreen(),
      // Profile(),
      //  TabsScreen(),
    );
  }
}
