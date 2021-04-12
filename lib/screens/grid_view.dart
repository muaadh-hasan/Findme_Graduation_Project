
import 'package:findme_gp_project/models/message.dart';

import 'package:flutter/cupertino.dart';

class GriddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             // Expanded(child: relative(context)),

                              //SizedBox(width: 10),
                              //Expanded(flex:1, child: relative(context)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
    ;
    //  GridView.count(
    //          crossAxisCount: 2,
    //            padding: EdgeInsets.all(20),
    //            crossAxisSpacing: 10,
    //            mainAxisSpacing: 20,
    //            children: [
    //              relative(context),
    //              relative(context),
    //            ]);
  }
}
