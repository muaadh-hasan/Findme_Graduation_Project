import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourRelatives extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 175,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // border: Border.all(
            //   color: const Color(0xff60aad2),
            // ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff60aad2),
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),

          // width: 300,
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 1,
              crossAxisSpacing: 20,
              //mainAxisSpacing: 20,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              relative(context),
              relative(context),
              relative(context),
              relative(context),
              relative(context),
              relative(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget relative(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(18, 0, 160, 246),
        ),
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .060,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profileImage(context),
            Padding(
              padding: EdgeInsets.only(left: 3, right: 10),
              child: Text(
                'Mariam Nasser',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 13.5,
                  color: Colors.grey[700],
                  // letterSpacing: 1.05,
                  //  height: 1.542857142857143,
                ),

                //textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
