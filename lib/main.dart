import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:real_time_database/screens/context_menu.dart';
import 'package:real_time_database/screens/dialogue_box.dart';
import 'package:real_time_database/screens/form_validation.dart';
import 'package:real_time_database/screens/home_screen.dart';
import 'package:real_time_database/screens/segmented_control.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //TestPage(),
          FormValidationExample(),
    );
  }
}
