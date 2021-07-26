import 'package:findme_gp_project/models/notification_user.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:findme_gp_project/widgets/chats_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  NotificationUser notify;

  NotificationItem(this.notify);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff60aad2),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              children: [
                Container(
                  color: const Color(0xff60aad2),
                  child: customAppBar(context),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 16,
            child: Container(
              height: MediaQuery.of(context).size.height * .10,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(246, 246, 246, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .010),
                child: Column(
                  children: [
                    Row(
                      children: [
                        /*  Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: GestureDetector(
                                child: Icon(Icons.arrow_back),
                              ),
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * .060),
                            ),
                          ),
                        ),
                        */
                        Expanded(
                          flex: 22,
                          child: Text(
                            "Notification",
                            style: TextStyle(
                              fontFamily: 'Europa',
                              fontSize: 30,
                              color: const Color(0xff334856),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Text(
                          "More Information",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        notify.smallDescription,
                        style: TextStyle(fontSize: 20),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customAppBar(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height *.6,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .060,
                    //left: MediaQuery.of(context).size.width * .010,
                  ),
                  child: Image(
                    height: MediaQuery.of(context).size.height * .08,
                    image: const AssetImage('assets/images/new_logo.png'),
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Container(
                //   child: GestureDetector(
                //       child: largeProfileImage(context),
                //       onTap: () {
                //         Navigator.pop(context);
                //         Navigator.of(context).pushReplacement(
                //             new MaterialPageRoute(
                //                 builder: (BuildContext context) => Profile()));
                //       }),
                //   margin: EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height * .073,
                //       right: MediaQuery.of(context).size.width * .015),
                // ),
              ],
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}
