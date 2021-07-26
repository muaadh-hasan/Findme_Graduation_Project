import 'package:findme_gp_project/models/user.dart';
import 'package:intl/intl.dart';

class Message {
  final User sender;
  final DateTime
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });

  String formatDate(DateTime date) => new DateFormat("Hm").format(date);
}

// Account account1 = Account(
//   name: "Mariam Nasser",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'mariamnasser979@gmail.com',
// );
// Account account2 = Account(
//   name: "Yasmeena Badawy",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'yasmeena@gmail.com',
// );
// Account account3 = Account(
//   name: "Yasmeena3",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'yasmeena3@gmail.com',
// );
// Account account4 = Account(
//   name: "Yasmeena4",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'yasmeena4@gmail.com',
// );
// Account account5 = Account(
//   name: "Yasmeena5",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'yasmeen5@gmail.com',
// );
// Account account6 = Account(
//   name: "Yasmeena6",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'yasmeena6@gmail.com',
// );
// Account account7 = Account(
//   name: "Yasmeena7",
//   images: ['assets/images/pic9.jpg'],
//   phone: '+021111137744',
//   email: 'yasmeena7@gmail.com',
// );
// // YOU - current user
// final User currentUser = User(account: account1);

// // USERS
// final User yasmeena = User(account: account2);
// final User mariam = User(account: account1);
// final User yasmeena3 = User(account: account3);
// final User yasmeena4 = User(account: account4);
// final User yasmeena5 = User(account: account5);
// final User yasmeena6 = User(account: account6);
// final User yasmeena7 = User(account: account7);

// // just static data for UI
// List<User> users = [
//   mariam,
//   yasmeena,
//   yasmeena3,
//   yasmeena4,
//   yasmeena5,
//   yasmeena6,
//   yasmeena7,
// ];

// // EXAMPLE CHATS ON HOME SCREEN
// List<Message> chats = [
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: true,
//   ),
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: true,
//   ),
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: false,
//   ),
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: true,
//   ),
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: false,
//   ),
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: false,
//   ),
//   Message(
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'Hey, how\'s it going? What did you do today?',
//     unread: false,
//   ),
// ];

// // EXAMPLE MESSAGES IN CHAT SCREEN
// List<Message> messages = [
//   Message(
//     sender: yasmeena,
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
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'How\'s the doggo?',
//     unread: true,
//   ),
//   Message(
//     sender: yasmeena,
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
//     sender: yasmeena,
//     time: DateTime.now(),
//     text: 'I ate so much food today.',
//     unread: true,
//   ),
// ];
