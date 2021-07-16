// import 'package:findme_gp_project/models/message.dart';
// import 'package:findme_gp_project/widgets/chats_widgets.dart';
// import 'package:flutter/material.dart';

// import '../data.dart';

// class IndividualChatScreen extends StatelessWidget {
//   List<Message> messages;
//   IndividualChatScreen(this.messages);
//   bool opacityOfAppBar = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff60aad2),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 3,
//             child: ListView(
//               padding: EdgeInsets.only(top: 0.0),
//               children: [
//                 Container(
//                   color: const Color(0xff60aad2),
//                   child: customAppBar(context),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 16,
//             child: Container(
//               height: MediaQuery.of(context).size.height * .10,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Color.fromRGBO(246, 246, 246, 1),
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
//                             messages[0].sender.name,
//                             style: TextStyle(
//                               fontFamily: 'Europa',
//                               fontSize: 30,
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
//                     Expanded(
//                       child: GestureDetector(
//                           onTap: () {
//                             opacityOfAppBar = false;

//                             FocusScope.of(context).unfocus();
//                           },
//                           child: Column(children: <Widget>[
//                             Expanded(
//                               child: Container(
//                                 child: ClipRRect(
//                                   child: ListView.builder(
//                                     reverse: true,
//                                     padding: EdgeInsets.only(top: 15.0),
//                                     itemCount: messages.length,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       final Message message = messages[index];
//                                       final bool isMe = message.sender.email ==
//                                           currentUser.email;
//                                       return _buildMessage(
//                                           message, isMe, context);
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             _buildMessageComposer(context),
//                           ])),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _buildMessage(Message message, bool isMe, BuildContext context) {
//     final Container msg = Container(
//       padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
//       width: MediaQuery.of(context).size.width * 0.75,
//       child: !isMe
//           ? Column(
//               children: [
//                 Row(
//                   //  mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     smallProfileImage(context),
//                     SizedBox(
//                       width: 8.0,
//                     ),
//                     Expanded(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30.0),
//                             topRight: Radius.circular(30.0),
//                             bottomRight: Radius.circular(30.0),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromRGBO(141, 190, 216, 1),
//                               offset: Offset(0.0, 3.0), //(x,y)
//                               blurRadius: 6.0,
//                             ),
//                           ],
//                         ),
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Text(
//                             message.text,
//                             style: TextStyle(
//                               color: Colors.blueGrey,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Container(
//                     margin: EdgeInsets.only(top: 5, right: 30),
//                     child: Text(
//                       message.time.toString(),
//                       style: TextStyle(
//                         color: Colors.blueGrey,
//                         fontSize: 9.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : Column(
//               children: [
//                 Row(
//                   //  mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Expanded(
//                       child: Container(
//                         margin: EdgeInsets.only(right: 10, bottom: 10),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff60aad2),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(30.0),
//                             topRight: Radius.circular(30.0),
//                             bottomLeft: Radius.circular(30.0),
//                             // bottomRight: Radius.circular(30.0),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey,
//                               offset: Offset(0.0, 3.0), //(x,y)
//                               blurRadius: 6.0,
//                             ),
//                           ],
//                         ),
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Text(
//                             message.text,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     smallProfileImage(context),
//                   ],
//                 ),
//                 Align(
//                   alignment: Alignment.bottomLeft,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 30),
//                     child: Text(
//                       message.time.toString(),
//                       style: TextStyle(
//                         color: Colors.blueGrey,
//                         fontSize: 9.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );

//     if (isMe) {
//       return msg;
//     }

//     return Row(
//       children: <Widget>[
//         msg,
//       ],
//     );
//   }

//   _buildMessageComposer(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8.0),
//       height: 70.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40.0),
//           topRight: Radius.circular(40.0),
//           bottomLeft: Radius.circular(40.0),
//           // bottomRight: Radius.circular(30.0),
//         ),
//       ),
//       child: Row(
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.photo),
//             iconSize: 25.0,
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           ),
//           Expanded(
//             child: Container(
//               child: TextField(
//                 textCapitalization: TextCapitalization.sentences,
//                 onChanged: (value) {},
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Send a message...',
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             iconSize: 25.0,
//             color: Theme.of(context).primaryColor,
//             onPressed: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
