import 'package:timelineapp/forms/loginform.dart';
import 'package:timelineapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:timelineapp/style/style.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // double width = (screenWidth(context) < screenHeight(context) ? 0.95 : 0.5) * screenWidth(context);
    return Scaffold(
        body: Center(
            child: SizedBox(
                child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: LoginForm(onTap: () => _successfulLogin(context)),
                    )))));
  }

  static void _successfulLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => HomePage()),
      ModalRoute.withName('/'),
    );
  }
}
