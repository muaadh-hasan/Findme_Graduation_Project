// // import 'models/chat.dart';
// import 'models/message.dart';
// import 'models/notification_user.dart';
// import 'models/post.dart';
// import 'models/user.dart';
// import 'package:intl/intl.dart';

// String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);

// User user1 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user2 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user3 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user4 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user5 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user6 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user7 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// User user8 = User(
//   username: "Yasmeena Badawy",
//   profilePicture: 'assets/images/pic9.jpg',
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );

// List<User> users = [user1, user2, user3, user4, user5, user6, user7, user8];

// List<Message> messages = [
//   Message(
//     sender: user1,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: true,
//   ),
//   Message(
//     sender: currentUser,
//     time: DateTime.now(),
//     text: 'Just walked my doge. She was super duper cute. The best pupper!!',
//     unread: true,
//   ),
//   Message(
//     sender: user1,
//     time: DateTime.now(),
//     text: 'How\'s the doggo?',
//     unread: true,
//   ),
//   Message(
//     sender: user1,
//     time: DateTime.now(),
//     text: 'All the food',
//     unread: true,
//   ),
//   Message(
//     sender: currentUser,
//     time: DateTime.now(),
//     text: 'Nice! What kind of food did you eat?',
//     unread: true,
//   ),
//   Message(
//     sender: user1,
//     time: DateTime.now(),
//     text: 'I ate so much food today.',
//     unread: true,
//   ),
// ];

// final User currentUser = User(
//   username: 'Moaaz Hasan',
//   profilePicture:
//       'https://avatars.githubusercontent.com/u/36192122?s=400&u=1dfc7f24e3963182b2f70df53209d4d9b086479c&v=4',

//   email: 'mo2222ath@gmail.com',
//   posts: [
//     Post(
//       date: DateTime.now(),
//       infoPost:
//           'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       image:
//           'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//     ),
//     Post(
//       date: DateTime.now(),
//       infoPost:
//           'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       image:
//           'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//     ),
//     Post(
//       date: DateTime.now(),
//       infoPost:
//           'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       image:
//           'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//     ),
//     Post(
//       date: DateTime.now(),
//       infoPost:
//           'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       image:
//           'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//     ),
//     Post(
//       date: DateTime.now(),
//       infoPost:
//           'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       image:
//           'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//     ),
//     Post(
//       date: DateTime.now(),
//       infoPost:
//           'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//       image:
//           'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
//     ),
//   ],
//   notifications: [
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription: 'Wants to be a friend with you',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//     NotificationUser(
//         date: formatDate(DateTime.now()),
//         smallDescription:
//             'This person found a lost person from your family, check it out!',
//         user: User(username: "Moaaz Hasan")),
//   ],
//   // chats: [
//   //   Chat(messages: messages),
//   //   Chat(messages: messages),
//   //   Chat(messages: messages),
//   //   Chat(messages: messages),
//   //   Chat(messages: messages),
//   //   Chat(messages: messages),
//   //   Chat(messages: messages)
//   // ],
// );
