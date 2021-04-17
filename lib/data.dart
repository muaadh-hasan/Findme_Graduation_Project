import 'models/account.dart';
import 'models/notification_user.dart';
import 'models/post.dart';
import 'models/user.dart';
import 'package:intl/intl.dart';

String formatDate(DateTime date) => new DateFormat("MMMM d").format(date);

final User currentUser = User(
    account: Account(
      name: 'Moaaz Hasan',
      images: [
        'https://avatars.githubusercontent.com/u/36192122?s=400&u=1dfc7f24e3963182b2f70df53209d4d9b086479c&v=4',
      ],
      email: 'mo2222ath@gmail.com',
    ),
    posts: [
      Post(
        date: DateTime.now(),
        infoPost:
            'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        listImages: [
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        ],
        user: User(
            account: Account(name: 'Rufaidah', images: [
          'https://th.bing.com/th/id/OIP.EiYMXYhAnpsXnVmwJAq1jAHaEo?pid=ImgDet&rs=1',
        ])),
      ),
      Post(
        date: DateTime.now(),
        infoPost:
            'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        listImages: [
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        ],
        user: User(
            account: Account(name: 'Rufaidah', images: [
          'https://th.bing.com/th/id/OIP.EiYMXYhAnpsXnVmwJAq1jAHaEo?pid=ImgDet&rs=1',
        ])),
      ),
      Post(
        date: DateTime.now(),
        infoPost:
            'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        listImages: [
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        ],
        user: User(
            account: Account(name: 'Rufaidah', images: [
          'https://th.bing.com/th/id/OIP.EiYMXYhAnpsXnVmwJAq1jAHaEo?pid=ImgDet&rs=1',
        ])),
      ),
      Post(
        date: DateTime.now(),
        infoPost:
            'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        listImages: [
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        ],
        user: User(
            account: Account(name: 'Rufaidah', images: [
          'https://th.bing.com/th/id/OIP.EiYMXYhAnpsXnVmwJAq1jAHaEo?pid=ImgDet&rs=1',
        ])),
      ),
      Post(
        date: DateTime.now(),
        infoPost:
            'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        listImages: [
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        ],
        user: User(
            account: Account(name: 'Rufaidah', images: [
          'https://th.bing.com/th/id/OIP.EiYMXYhAnpsXnVmwJAq1jAHaEo?pid=ImgDet&rs=1',
        ])),
      ),
      Post(
        date: DateTime.now(),
        infoPost:
            'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        listImages: [
          'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
        ],
        user: User(
            account: Account(name: 'Rufaidah', images: [
          'https://th.bing.com/th/id/OIP.EiYMXYhAnpsXnVmwJAq1jAHaEo?pid=ImgDet&rs=1',
        ])),
      ),
    ],
    notifications: [
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription: 'Wants to be a friend with you',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
      NotificationUser(
          date: formatDate(DateTime.now()),
          smallDescription:
              'This person found a lost person from your family, check it out!',
          user: User(account: Account(name: "Moaaz Hasan"))),
    ]);
