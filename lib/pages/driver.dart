import 'package:timelineapp/pages/authentication.dart';
import 'package:timelineapp/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Chat/ChatList.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  State<Driver> createState() => _State();
}

class _State extends State<Driver> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return _auth.currentUser == null
        ? const Authentication()
        : const HomePage();
  }
}
