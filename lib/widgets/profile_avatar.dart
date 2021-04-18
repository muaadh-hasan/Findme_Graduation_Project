import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
      ],
    );
  }
}
