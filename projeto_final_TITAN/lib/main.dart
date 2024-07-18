import 'package:flutter/material.dart';
import 'package:projeto_final_titan/screens/home_screen.dart';
import 'package:projeto_final_titan/screens/profile_screen.dart';
import 'package:projeto_final_titan/screens/settings_screen.dart';
import 'package:projeto_final_titan/screens/signup_screen.dart';
import 'package:projeto_final_titan/screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação de Telas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
