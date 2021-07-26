import 'package:findme_gp_project/models/chat.dart';
import 'package:findme_gp_project/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data.dart';

Widget largeProfileImage(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * .060,
    height: MediaQuery.of(context).size.height * .060,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      image: DecorationImage(
        image: NetworkImage(
            'https://avatars.githubusercontent.com/u/36192122?s=400&u=1dfc7f24e3963182b2f70df53209d4d9b086479c&v=4'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget smallProfileImage(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * .050,
    height: MediaQuery.of(context).size.height * .050,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      image: DecorationImage(
        image: const AssetImage('assets/images/profile_image.jpg'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget mainLogo() {
  return Container(
    child: Stack(children: <Widget>[
      Transform.translate(
        offset: Offset(18.0, 64.9),
        child: SvgPicture.string(
          _svg_cb13oo,
          allowDrawingOutsideViewBox: true,
        ),
      ),
      Transform.translate(
        offset: Offset(17.0, 33.0),
        child: Container(
          width: 53.0,
          height: 55.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/logo_pic.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Transform.translate(
        offset: Offset(27.0, 88.0),
        child: SizedBox(
          width: 35.0,
          child: Text(
            'Find me',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 7,
              color: const Color(0xff474747),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ]),
  );
}

Widget backIcon(Function back) {
  return GestureDetector(
      onTap: back,
      child: Transform.translate(
        offset: Offset(34.0, 146.0),
        child: Container(
          width: 11.0,
          height: 17.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/back_icon.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ));
}

Widget mainContainer() {
  return Container(
    child: Transform.translate(
      offset: Offset(0.0, 112.5),
      child: SvgPicture.string(
        _svg_u4s8of,
        allowDrawingOutsideViewBox: true,
      ),
    ),
  );
}

Widget mainTitle(String title) {
  return Transform.translate(
    offset: Offset(161.8, 136.0),
    child: SizedBox(
      width: 91.0,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Europa',
          fontSize: 29,
          color: const Color(0xff334856),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget searchContainernChats(String str, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff60aad2),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .060,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).devicePixelRatio * 5,
        left: MediaQuery.of(context).devicePixelRatio * 5,
        right: MediaQuery.of(context).devicePixelRatio * 5,
      ),
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

const String _svg_cb13oo =
    '<svg viewBox="18.0 64.9 51.8 36.1" ><path transform="translate(18.0, -43.63)" d="M 25.16500854492188 130.5182495117188 C 39.461181640625 130.5182495117188 51.77102279663086 96.91122436523438 51.77102279663086 112.8411178588867 L 51.77102279663086 115.7820358276367 C 51.77102279663086 131.7118988037109 40.18168258666992 144.6256103515625 25.88551139831543 144.6256103515625 C 11.5893383026123 144.6256103515625 0 131.7118988037109 0 115.7820358276367 L 0 112.8411178588867 C 0 96.91122436523438 10.86883640289307 130.5182495117188 25.16500854492188 130.5182495117188 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u4s8of =
    '<svg viewBox="0.0 112.5 413.0 784.3" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 413.0, 896.83)" d="M 0 0 L 413 0 L 413 752.5359497070313 C 413 770.0972900390625 398.2074890136719 784.3333129882813 379.9599914550781 784.3333129882813 L 33.04000091552734 784.3333129882813 C 14.79251194000244 784.3333129882813 0 770.0972900390625 0 752.5359497070313 L 0 0 Z" fill="#f6f6f6" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
