import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelativeRequests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 182,
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: relativeRequest(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: relativeRequest(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: relativeRequest(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: relativeRequest(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
