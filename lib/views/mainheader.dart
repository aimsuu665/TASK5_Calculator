import 'package:flutter/material.dart';
import 'package:project1/models/userdata.dart';

class Mainheader extends StatelessWidget {
  const Mainheader({super.key, required this.userdata});

  final Userdata userdata;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(userdata.myUserAccount.img), // fixed here
          radius: 40,
        ),
        Text(
          userdata.myUserAccount.name, // fixed here
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(userdata.myUserAccount.email), // fixed here
        const SizedBox(height: 20),
      ],
    );
  }
}
