import 'package:timelineapp/model/user.dart';
import 'package:timelineapp/pages/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.observedUser}) : super(key: key);
  final User observedUser;

  @override
  State<ProfilePage> createState() => _State();
}

class _State extends State<ProfilePage> {
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
