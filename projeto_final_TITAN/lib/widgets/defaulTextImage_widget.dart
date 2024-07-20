import 'package:flutter/material.dart';

class DefaultTextImage extends StatelessWidget {
  final String imageSrc;
  final String title;
  final String textComplete;

  const DefaultTextImage(
      {required this.imageSrc,
      required this.title,
      required this.textComplete,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(imageSrc, height: 250),
        const SizedBox(height: 20),
        Text(title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text(textComplete,
            style: const TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 20)
      ],
    );
  }
}
