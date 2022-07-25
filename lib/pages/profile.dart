import 'package:timelineapp/model/user.dart';
import 'package:timelineapp/pages/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.observedUser}) : super(key: key);
  final User observedUser;

  @override
  State<Profile> createState() => _State();
}

class _State extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.observedUser.name)),
      body: Center(
        child: Text(widget.observedUser.bio),
      ),
    );
  }
}
