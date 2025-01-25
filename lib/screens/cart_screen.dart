import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartProvider>(context).cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty!'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final book = cartItems[index];
                return ListTile(
                  leading: Image.asset(book['image']!, width: 50),
                  title: Text(book['title']!),
                  subtitle: Text('by ${book['author']} - \$${book['price']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).removeFromCart(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${book['title']} removed from cart')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
