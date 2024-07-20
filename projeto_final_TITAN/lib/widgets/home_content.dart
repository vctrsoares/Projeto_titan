import 'package:flutter/material.dart';
import '../components/user_service.dart';
import '../widgets/category_chip.dart';
import '../widgets/custom_card.dart';
import '../screens/product_detail.dart';
import '../screens/cart_screen.dart';

class HomeContent extends StatelessWidget {
  final Function(int) onAddToCart;
  final int cartItemCount;
  final UserService _userService = UserService();

  HomeContent({required this.onAddToCart, required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _userService.getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar o nome do usuário'));
        } else {
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              SizedBox(height: 40.0), // Ajuste para evitar a câmera do celular
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá,',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        snapshot.data ?? 'NomeDeUsuário',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Stack(
                      children: [
                        Icon(Icons.shopping_cart),
                        if (cartItemCount > 0)
                          Positioned(
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: Text(
                                '$cartItemCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            onCartCleared: () {
                              // Callback para limpar o contador de itens do carrinho
                              onAddToCart(-cartItemCount);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                children: [
                  Text(
                    'Categoria:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  CategoryChip(label: '#CSS'),
                  CategoryChip(label: '#UX'),
                  CategoryChip(label: '#Swift'),
                  CategoryChip(label: '#UI'),
                ],
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailPage(
                        courseTitle: 'UI',
                        courseDescription:
                            'Você pode iniciar uma nova carreira em design de interfaces hoje aprendendo UI Design. Tudo que você precisa é de um computador, um pouco de tempo, muita determinação e um professor em quem você confie. ',
                        courseDuration: '3h 30min',
                        coursePrice: 50.0,
                        courseImage: 'assets/images/image_uiscreen.png',
                        onAddToCart: () {
                          onAddToCart(1);
                        },
                      ),
                    ),
                  ); // Navegar para a tela de detalhes do curso UI
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
                      builder: (context) => CourseDetailPage(
                        courseTitle: 'HTML',
                        courseDescription:
                            'Você pode iniciar uma nova carreira em desenvolvimento web mento hoje aprendendo HTML e CSS. Tudo que você precisa é de um computador, um pouco de tempo, muita determinação e um professor em quem você confie. ',
                        courseDuration: '3h 30min',
                        coursePrice: 50.0,
                        courseImage: 'assets/images/image_htmlcourse.png',
                        onAddToCart: () {
                          onAddToCart(1);
                        },
                      ),
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
          );
        }
      },
    );
  }
}
