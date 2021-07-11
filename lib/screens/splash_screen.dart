import 'package:findme_gp_project/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  child: Image.asset(
                    'assets/images/splash2.png',
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return HomeScreen();
                          // }));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'GET STARTED ',
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.black54,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 50,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ),

                      // Container(
                      //   color: Colors.white,
                      //   child: Text(
                      //     'GET STARTED',
                      //     style: TextStyle(fontSize: 30),
                      //   ),
                      // ),

                      // ElevatedButton.icon(
                      //   onPressed: () {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) {
                      //       return HomeScreen();
                      //     }));
                      //   },
                      //   label: Text(
                      //     "GET STARTED",
                      //     style: TextStyle(fontSize: 30),
                      //   ),
                      //   icon: Icon(Icons.arrow_forward_ios, size: 30),
                      //   style: ElevatedButton.styleFrom(
                      //       // shape: RoundedRectangleBorder(
                      //       //     borderRadius: BorderRadius.circular(30)),
                      //       ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
