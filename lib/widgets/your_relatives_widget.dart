import 'package:findme_gp_project/models/relative.dart';
import 'package:findme_gp_project/providers/user_provider.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YourRelatives extends StatelessWidget {
  List<Relative> relatives;

  @override
  Widget build(BuildContext context) {
    relatives = context.read<UserProvider>().currentUser.relatives;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
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
          child: relatives.length == 0
              ? Center(child: Text("No Relatives yet!"))
              : ListView.builder(
                  itemCount: relatives.length,
                  itemBuilder: (context, index) {
                    return relative(context, relatives[index]);
                  }),
        ),
      ],
    );
  }

  Widget relative(BuildContext context, Relative relative) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color.fromARGB(18, 0, 160, 246),
        ),
        width: MediaQuery.of(context).size.width * .90,
        height: MediaQuery.of(context).size.height * .060,
        margin: EdgeInsets.only(
          //  top: !isLandScape ? MediaQuery.of(context).size.height* .28
          // : MediaQuery.of(context).size.height* .55,
          left: MediaQuery.of(context).devicePixelRatio * 2,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // profileImage(context,relative.profilePicture),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    profileImage(context, relative.profilePicture),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, right: 10),
                      child: Text(
                        relative.username,
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

              Expanded(
                flex: 1,
                child: InkWell(
                  child: button(Colors.red, "Delete", context),
                  onTap: () async {
                    bool check = await context
                        .read<UserProvider>()
                        .deleteRelative(relative.userId);

                    print("check ****************");
                    print(check);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(context.read<UserProvider>().message)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(Color color, String str, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.height * .09,
        height: MediaQuery.of(context).size.height * .035,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
