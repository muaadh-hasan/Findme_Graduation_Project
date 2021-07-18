import 'dart:io';

import 'package:findme_gp_project/providers/location_provider.dart';
import 'package:findme_gp_project/screens/map_screen.dart';

import 'package:findme_gp_project/providers/profile_provider.dart';
import 'package:findme_gp_project/screens/profile_screen.dart';
import 'package:findme_gp_project/screens/search.dart';
import 'package:findme_gp_project/screens/settings.dart';
import 'package:findme_gp_project/widgets/relative_requests_widget.dart';
import 'package:findme_gp_project/widgets/your_photos_widget.dart';
import 'package:findme_gp_project/widgets/your_relatives_widget.dart';
import 'package:findme_gp_project/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../data.dart';

Widget customProfileAppBar(BuildContext context) {
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
                  left: MediaQuery.of(context).size.width * .030,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
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
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .060,
                  right: MediaQuery.of(context).size.width * .030,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
        ),
      ],
    ),
  );
}

Widget headerContents(BuildContext context) {
  return Container(
    // height: MediaQuery.of(context).size.height *.6,
    child: Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 20,
              // bottom: MediaQuery.of(context).devicePixelRatio * 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.2,
                image: NetworkImage(currentUser.images[0]),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.only(
              // bottom: MediaQuery.of(context).size.height * .07,
              left: MediaQuery.of(context).size.width * .030,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.name,
                  style: TextStyle(
                    fontFamily: 'Europa',
                    fontSize: 29,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      currentUser.email,
                      style: TextStyle(
                        fontFamily: 'Europa',
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "+201111137744",
                      style: TextStyle(
                        fontFamily: 'Europa',
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget locationIcon(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image(
          image: const AssetImage(
            'assets/images/location_icon.png',
          ),
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

Widget separator(String str, BuildContext context) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Divider(
          thickness: 1,
        ),
      ),
      Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              str,
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff60aad2),
                backgroundColor: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget searchContainer(String str, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Search()),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff60aad2),
            offset: Offset(0.0, 3.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * .80,
      height: MediaQuery.of(context).size.height * .060,
      // margin: EdgeInsets.only(
      //   top: !isLandScape
      //       ? MediaQuery.of(context).size.height * .28
      //       : MediaQuery.of(context).size.height * .55,
      //   left: MediaQuery.of(context).devicePixelRatio * 10,
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    str,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17.5,
                      color: const Color(0xff60aad2),
                      letterSpacing: 1.05,
                      //  height: 1.542857142857143,
                    ),

                    //textAlign: TextAlign.left,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.search,
                          color: const Color(0xff60aad2),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget relativeRequest(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Color.fromARGB(18, 0, 160, 246),
    ),
    width: MediaQuery.of(context).size.width * .90,
    height: MediaQuery.of(context).size.height * .060,
    margin: EdgeInsets.only(
      //  top: !isLandScape ? MediaQuery.of(context).size.height* .28
      // : MediaQuery.of(context).size.height* .55,
      left: MediaQuery.of(context).devicePixelRatio * 10,
    ),
    child: Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileImage(context),
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            'Mariam Nasser',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15.5,
              color: Colors.grey[700],
              //letterSpacing: 1.05,
              //  height: 1.542857142857143,
            ),

            //textAlign: TextAlign.left,
          ),
        ),
        SizedBox(width: 2),
        button(Colors.green, "Confirm", context),
        button(Colors.red, "Delete", context),
      ],
    ),
  );
}

Widget profileImage(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * .060,
    height: MediaQuery.of(context).size.height * .060,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      image: DecorationImage(
        image: const AssetImage('assets/images/profile_image.jpg'),
        fit: BoxFit.cover,
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

Widget getImageButton(BuildContext context) {
  return Container(
    width: double.infinity,
    child: RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text("Choose Image"),
      onPressed: () {
        var ad = AlertDialog(
          title: Text("Choose Picture from:"),
          content: Container(
            height: 150,
            child: Column(
              children: [
                Divider(color: Colors.black),
                buildDialogItem(context, "Camera", Icons.add_a_photo_outlined,
                    ImageSource.camera),
                SizedBox(height: 10),
                buildDialogItem(context, "Gallery", Icons.image_outlined,
                    ImageSource.gallery),
              ],
            ),
          ),
        );
        showDialog(builder: (context) => ad, context: context);
      },
    ),
  );
}
