import 'package:flutter/material.dart';
import 'package:projeto_final_titan/screens/home_screen.dart';
import 'your_courses_screen.dart';
import '../widgets/bordered_elevated_button.dart';
import 'login_screen.dart';
import 'not_saved_screen.dart';
import 'payment_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/image_profile.png'),
                ),
              ),
              const SizedBox(height: 20),
              BorderedElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourCoursesPage(),
                    ),
                  ); // Navegar para a página de cursos
                },
                text: 'Seus cursos',
              ),
              const SizedBox(height: 10),
              BorderedElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedCoursesPage(),
                    ),
                  ); // Navegar para a página de salvos
                },
                text: 'Salvos',
              ),
              const SizedBox(height: 10),
              BorderedElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(),
                    ),
                  ); // Navegar para a página de pagamento
                },
                text: 'Pagamento',
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text(
                  'Sair do aplicativo',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
