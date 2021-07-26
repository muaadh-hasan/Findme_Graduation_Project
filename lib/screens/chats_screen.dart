// import 'package:findme_gp_project/widgets/chats_widgets.dart';
// import 'package:findme_gp_project/widgets/profile_widgets.dart';
// import 'package:flutter/material.dart';

// import '../data.dart';

// class ChatsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff60aad2),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//               color: const Color(0xff60aad2),
//               child: customAppBar(context),
//             ),
//           ),
//           Expanded(
//             flex: 16,
//             child: Container(
//               height: MediaQuery.of(context).size.height * .10,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   )),
//               child: Container(
//                 margin: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * .010),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 1,
//                           child: Container(
//                             child: Icon(Icons.arrow_back),
//                             margin: EdgeInsets.only(
//                                 left: MediaQuery.of(context).size.width * .060),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 22,
//                           child: Text(
//                             "Chats",
//                             style: TextStyle(
//                               fontFamily: 'Europa',
//                               fontSize: 40,
//                               color: const Color(0xff334856),
//                               fontWeight: FontWeight.w700,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Divider(
//                       color: const Color.fromARGB(100, 6, 63, 94),
//                     ),
//                     searchContainernChats("Search someone ... ", context),
//                     recentChats(context, currentUser.chats),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
