import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/screens/home.dart';
import 'package:week_4/screens/login.dart';
import 'package:week_4/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLogin';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }

  
}
