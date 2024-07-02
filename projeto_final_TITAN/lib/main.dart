import 'package:flutter/material.dart';
import 'login_screen.dart'; // Certifique-se de importar o arquivo login_screen.dart

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
      home: const LoginPage(),
    );
  }
}
