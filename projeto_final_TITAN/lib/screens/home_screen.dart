import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import '../widgets/home_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _cartItemCount = 0;

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadCartItemCount();
  }

  Future<void> _loadUserName() async {
    setState(() {});
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

  void _clearCartItemCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cartItemCount', 0);
    setState(() {
      _cartItemCount = 0;
    });
  }

  List<Widget> _buildWidgetOptions() {
    return <Widget>[
      HomeContent(
        onAddToCart: (count) => _updateCartItemCount(_cartItemCount + count),
        cartItemCount: _cartItemCount,
      ),
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
