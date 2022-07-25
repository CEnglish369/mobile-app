import 'package:timelineapp/pages/driver.dart';
import 'package:timelineapp/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirestoreService _ = FirestoreService();
  runApp(const SocialApp());
}

class SocialApp extends StatelessWidget {
  const SocialApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fiddles Timelines',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Driver());
  }
}
