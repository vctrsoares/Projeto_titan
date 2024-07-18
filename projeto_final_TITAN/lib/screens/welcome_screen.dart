import 'package:flutter/material.dart';
import '../widgets/defaulTextImage_widget.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int page = 0;
  String textButton = 'Próximo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'Skip',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
            ),
            Column(
              children: [
                if (page == 0)
                  DefaultTextImage(
                    imageSrc: 'assets/images/image_welcome_1.png',
                    title: 'Aprenda a qualquer hora e em qualquer lugar',
                    textComplete: 'Sempre é o momento perfeito para passar o tempo dia aprendendo algo novo, de qualquer lugar!',
                  )
                else if (page == 1)
                  DefaultTextImage(
                    imageSrc: 'assets/images/image_welcome_2.png',
                    title: 'Encontre um curso para você',
                    textComplete: 'O conhecimento não tem fronteiras, nem o seu potencial. Explore um novo universo hoje!',
                  )
                else
                  DefaultTextImage(
                    imageSrc: 'assets/images/image_welcome_3.png',
                    title: 'Aperfeiçoe suas habilidades',
                    textComplete: 'O aprendizado é a única aventura que dura a vida toda.',
                  ),
                Container(
                  width: 60,
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        page == 0 ? Icons.catching_pokemon : Icons.circle,
                        size: 10,
                        color: page == 0 ? Colors.blue : Colors.black12,
                      ),
                      Icon(
                        page == 1 ? Icons.catching_pokemon : Icons.circle,
                        size: 10,
                        color: page == 1 ? Colors.blue : Colors.black12,
                      ),
                      Icon(
                        page == 2 ? Icons.catching_pokemon : Icons.circle,
                        size: 10,
                        color: page == 2 ? Colors.blue : Colors.black12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (page < 2) {
                    page++;
                    if (page == 2) {
                      textButton = 'Vamos Começar';
                    }
                  } else {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE3562A),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                textButton,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
