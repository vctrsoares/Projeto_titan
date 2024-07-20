import 'dart:convert'; // Importar a biblioteca para manipulação de JSON
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'payment_screen.dart'; // Importar a tela de pagamento
import '../widgets/custom_card.dart'; // Importar o CustomCard

class CartScreen extends StatefulWidget {
  final VoidCallback onCartCleared;

  CartScreen({required this.onCartCleared});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _cartItems = (prefs.getStringList('cartItems') ?? [])
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> _clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
    setState(() {
      _cartItems = [];
    });
    widget.onCartCleared(); // Notificar a HomePage que o carrinho foi esvaziado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: _cartItems.isEmpty
          ? Center(child: Text('Seu carrinho está vazio'))
          : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final item = _cartItems[index];
                return CustomCard(
                  duration: item['duration'],
                  title: item['title'],
                  description: item['description'],
                  imagePath: item['imagePath'],
                );
              },
            ),
      bottomNavigationBar: _cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _clearCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange, // Cor de fundo laranja
                        foregroundColor: Colors.white, // Cor do texto
                        padding: EdgeInsets.symmetric(vertical: 16.0), // Tamanho do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Borda arredondada
                        ),
                      ),
                      child: Text('Esvaziar Carrinho'),
                    ),
                  ),
                  SizedBox(width: 16.0), // Espaço entre os botões
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange, // Cor de fundo laranja
                        foregroundColor: Colors.white, // Cor do texto
                        padding: EdgeInsets.symmetric(vertical: 16.0), // Tamanho do botão
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Borda arredondada
                        ),
                      ),
                      child: Text('Ir para Pagamento'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}