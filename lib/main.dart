import 'package:flutter/material.dart';
import 'package:instaclone/pages/home_page.dart';
import 'package:instaclone/pages/login_page.dart';
import 'package:instaclone/pages/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta clone',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      initialRoute: "home",
      routes: {
        "login":(context)=> LoginPage(),
        "registration":(context)=>RegistrationPage(),
        "home":(context)=>HomePage()
      },
    );
  }
}

