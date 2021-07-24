import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/screens/notification_Item_screen.dart';
import 'package:findme_gp_project/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data.dart';
import 'profile_avatar.dart';

// ignore: must_be_immutable
class ListViewNotification extends StatefulWidget {
  int count;

  ListViewNotification(this.count);

  @override
  _ListViewNotificationState createState() => _ListViewNotificationState();
}

class _ListViewNotificationState extends State<ListViewNotification> {
  @override
  Widget build(BuildContext context) {
    return context.read<UserProvider>().currentUser.notifications.length == 0
        ? Center(
            child: Text(
            "There is no Notification yet!",
            style: TextStyle(fontSize: 20),
          ))
        : ListView.builder(
            itemCount: widget.count,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                  margin: EdgeInsets.all(5),
                  color: Colors.blue[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  elevation: 5.0,
                  child: ListTile(
                    // leading: CircleAvatar(
                    //   child: ProfileAvatar(
                    //     imageUrl: context
                    //         .read<UserProvider>()
                    //         .currentUser
                    //         .profilePicture[0],
                    //   ),
                    // ),
                    title: RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(fontSize: 20.0),
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          text: context
                              .read<UserProvider>()
                              .currentUser
                              .notifications[position]
                              .smallDescription),
                    ),
                    // subtitle: Text(
                    //     context
                    //         .read<UserProvider>()
                    //         .currentUser
                    //         .notifications[position]
                    //         .smallDescription,
                    // style: TextStyle(
                    //   fontSize: 12,
                    //   letterSpacing: 1.0,
                    // )),
                    trailing: Text(
                      context
                          .read<UserProvider>()
                          .currentUser
                          .notifications[position]
                          .date
                          .split(' ')[0],
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 1.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => NotificationItem(
                              context
                                  .read<UserProvider>()
                                  .currentUser
                                  .notifications[position])));
                    },
                  ));
            },
          );
  }
}
