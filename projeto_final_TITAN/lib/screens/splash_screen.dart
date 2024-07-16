import 'package:flutter/material.dart';
import 'home_screen.dart'; // Certifique-se de importar a home screen corretamente

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 10), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.0, // Define a largura da imagem
              height: 200.0, // Define a altura da imagem
              child: Image.asset('assets/images/image_splashscreen.png'), // Caminho da imagem
            ),
            SizedBox(height: 20.0), // Espaçamento entre a imagem e o texto
            Text(
              'Code Factory',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
