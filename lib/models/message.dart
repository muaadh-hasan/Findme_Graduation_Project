import 'package:findme_gp_project/models/account.dart';
import 'package:findme_gp_project/models/user.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

Account account1 = Account(
  name: "Mariam Nasser",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'mariamnasser979@gmail.com',
);
Account account2 = Account(
  name: "Yasmeena Badawy",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'yasmeena@gmail.com',
);
Account account3 = Account(
  name: "Yasmeena3",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'yasmeena3@gmail.com',
);
Account account4 = Account(
  name: "Yasmeena4",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'yasmeena4@gmail.com',
);
Account account5 = Account(
  name: "Yasmeena5",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'yasmeen5@gmail.com',
);
Account account6 = Account(
  name: "Yasmeena6",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'yasmeena6@gmail.com',
);
Account account7 = Account(
  name: "Yasmeena7",
  images: ['assets/images/pic9.jpg'],
  phone: '+021111137744',
  email: 'yasmeena7@gmail.com',
);
// YOU - current user
final User currentUser = User(account: account1);

// USERS
final User yasmeena = User(account: account2);
final User mariam = User(account: account1);
final User yasmeena3 = User(account: account3);
final User yasmeena4 = User(account: account4);
final User yasmeena5 = User(account: account5);
final User yasmeena6 = User(account: account6);
final User yasmeena7 = User(account: account7);

// just static data for UI
List<User> users = [
  mariam,
  yasmeena,
  yasmeena3,
  yasmeena4,
  yasmeena5,
  yasmeena6,
  yasmeena7,

];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: yasmeena,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: yasmeena,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: yasmeena,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: yasmeena,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: yasmeena,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: yasmeena,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
  Message(
    sender: yasmeena,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: yasmeena,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    unread: true,
  ),
  Message(
    sender: yasmeena,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    unread: true,
  ),
  Message(
    sender: yasmeena,
    time: '3:15 PM',
    text: 'All the food',
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    unread: true,
  ),
  Message(
    sender: yasmeena,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    unread: true,
  ),
];
