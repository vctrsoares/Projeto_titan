import 'dart:convert'; // Importar a biblioteca para manipulação de JSON
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetailPage(
                  courseTitle: 'Curso de Flutter',
                  courseDescription: 'Aprenda Flutter do zero ao avançado.',
                  courseDuration: '40 horas',
                  coursePrice: 199.99,
                  courseImage: 'assets/flutter_course.png',
                  onAddToCart: () {},
                ),
              ),
            );
          },
          child: Text('Ver Detalhes do Curso'),
        ),
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseDuration;
  final double coursePrice;
  final String courseImage;
  final VoidCallback onAddToCart;

  CourseDetailPage({
    required this.courseTitle,
    required this.courseDescription,
    required this.courseDuration,
    required this.coursePrice,
    required this.courseImage,
    required this.onAddToCart,
  });

  Future<void> _addToCart(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartItems = prefs.getStringList('cartItems') ?? [];
    Map<String, dynamic> newItem = {
      'title': courseTitle,
      'description': courseDescription,
      'duration': courseDuration,
      'price': coursePrice,
      'imagePath': courseImage,
    };
    cartItems.add(jsonEncode(newItem));
    await prefs.setStringList('cartItems', cartItems);
    onAddToCart();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(courseImage),
            SizedBox(height: 16.0),
            Text(
              'Sobre o Curso',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'R\$${coursePrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              courseDescription,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Duração: $courseDuration',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _addToCart(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text('Adicionar ao Carrinho'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
