import 'package:flutter/material.dart';

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
        // leading: Image.asset('assets/images/l.jpg', height: 50, width: 50),
        // CircleAvatar(
        //   radius: 35,
        //   backgroundImage: AssetImage('assets/images/logo.png'),
        // ),
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
          IconButton(
              icon: Icon(Icons.notifications),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.message),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {}),
          Container(
            padding: EdgeInsets.all(7),
            child: CircleAvatar(
              radius: 35,

              // backgroundImage: ,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Hi Moaaz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text('Welcome Back !',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: null,
          )),
        ],
      ),
    );
  }
}
