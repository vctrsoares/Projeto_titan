import 'package:flutter/material.dart';
import 'package:projeto_final_titan/signup_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
      ),
      home: const SignUpPage(),
    );
  }
}
