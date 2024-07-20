import 'package:flutter/material.dart';
import '../widgets/custom_card.dart';

class YourCoursesPage extends StatelessWidget {
  const YourCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus cursos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CustomCard(
            duration: 'Parou em 1h 20 min',
            title: 'Flutter',
            description: 'Aplicativos iOS e android avançados',
            imagePath: 'assets/images/image_fluttercourse.png',
          ),
          SizedBox(height: 16.0),
          CustomCard(
            duration: 'Parou em 1h 20 min',
            title: 'Scrum',
            description: 'Curso avançado de organização de projetos',
            imagePath: 'assets/images/image_scrumcourse.png',
          ),
        ],
      ),
    );
  }
}
