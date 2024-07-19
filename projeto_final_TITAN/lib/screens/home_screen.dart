import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'product_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _userName = 'NomeDeUsuário';
  int _cartItemCount = 0;

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadCartItemCount();
  }

  Future<void> _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'NomeDeUsuário';
    });
  }

  Future<void> _loadCartItemCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cartItemCount = prefs.getInt('cartItemCount') ?? 0;
    });
  }

  void _updateCartItemCount(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cartItemCount', count);
    setState(() {
      _cartItemCount = count;
    });
  }

  List<Widget> _buildWidgetOptions() {
    return <Widget>[
      HomeContent(onAddToCart: (count) => _updateCartItemCount(_cartItemCount + count)),
      ProfilePage(),
      SettingsPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          if (_cartItemCount > 0)
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Adicionar lógica para abrir a tela do carrinho
                  },
                ),
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
                      '$_cartItemCount',
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
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _updateCartItemCount(0);
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _buildWidgetOptions(),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final Function(int) onAddToCart;

  HomeContent({required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getUserName(),
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
                ],
              ),
              SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                children: [
                  Text(
                    'Categoria:',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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

  Future<String> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? 'NomeDeUsuário';
  }
}

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.blue),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String duration;
  final String title;
  final String description;
  final String imagePath;

  const CustomCard({
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
        padding: EdgeInsets.all(16.0),
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
            SizedBox(height: 16.0),
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
    );
  }
}