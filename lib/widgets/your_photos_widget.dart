import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourPhotos extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        height: 300,
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
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 20,
            // mainAxisSpacing: 20,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemCount: 7,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/pic10.jpg',
                  ),
                )),
          ),
        ),
      ),
    ]);
  }
}
