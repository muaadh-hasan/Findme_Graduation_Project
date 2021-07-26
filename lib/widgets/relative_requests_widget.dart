import 'package:findme_gp_project/models/relative.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainRelativeRequests extends StatefulWidget {
  @override
  _MainRelativeRequestsState createState() => _MainRelativeRequestsState();
}

class _MainRelativeRequestsState extends State<MainRelativeRequests> {
  List<Relative> relativesRequests;

  @override
  Widget build(BuildContext context) {
    relativesRequests = context.watch<UserProvider>().currentUser.requests;
    print('Bethenjan*********************');
    print(relativesRequests.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 175,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff60aad2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),

          // width: 300,
          child: relativesRequests.length == 0
              ? Center(child: Text("No Relative Requests yet !!"))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemCount: relativesRequests.length,
                  itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child:
                          relativeRequest(context, relativesRequests[index])),
                ),
        ),
      ],
    );
  }
}
