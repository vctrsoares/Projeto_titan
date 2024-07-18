import 'package:flutter/material.dart';

class YourCoursesPage extends StatelessWidget {
  const YourCoursesPage({Key? key}) : super(key: key);

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
        children: [
          CustomCard(
            duration: 'Parou em 1h 20 min',
            title: 'Flutter',
            description: 'Aplicativos iOS e android avançados',
            imagePath: 'assets/images/image_fluttercourse.png',
          ),
          const SizedBox(height: 16.0),
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

class CustomCard extends StatelessWidget {
  final String duration;
  final String title;
  final String description;
  final String imagePath;

  CustomCard({
    required this.duration,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              duration,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
