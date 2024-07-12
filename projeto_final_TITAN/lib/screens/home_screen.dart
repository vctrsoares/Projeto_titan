import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, Juana Antonieta'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Categoria:',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            children: [
              Chip(label: Text('#CSS')),
              Chip(label: Text('#UX')),
              Chip(label: Text('#Swift')),
              Chip(label: Text('#UI')),
            ],
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UiCourseDetailScreen(),
                ),
              );
            },
            child: CustomCard(
              duration: '3 h 30 min',
              title: 'UI',
              description: 'Design avançado de interface móvel',
              imagePath: 'assets/images/image_uiscreen.png',
            ),
          ),
          SizedBox(height: 16.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HtmlCourseDetailScreen(),
                ),
              );
            },
            child: CustomCard(
              duration: '3 h 30 min',
              title: 'HTML',
              description: 'Aplicativos web avançados',
              imagePath: 'assets/images/image_htmlscreen.png',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Cursos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        selectedItemColor: Colors.amber[800],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
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
        ],
      ),
    );
  }
}

class UiCourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Curso de UI'),
      ),
      body: Center(
        child: Text('Informações detalhadas sobre o curso de UI.'),
      ),
    );
  }
}

class HtmlCourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Curso de HTML'),
      ),
      body: Center(
        child: Text('Informações detalhadas sobre o curso de HTML.'),
      ),
    );
  }
}
