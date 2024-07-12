import 'package:flutter/material.dart';
import 'package:projeto_final_titan/screens/home_screen.dart';
import 'package:projeto_final_titan/screens/profile_screen.dart';
import 'package:projeto_final_titan/screens/settings_screen.dart';
import 'package:projeto_final_titan/screens/signup_screen.dart';
import 'package:projeto_final_titan/screens/welcome_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String userName = 'Vitu';
  final String userEmail = 'usuario@example.com';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(),
      home: ProfilePage(),
    );
  }
}
