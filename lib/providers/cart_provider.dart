import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, String>> _cartItems = [];

  List<Map<String, String>> get cartItems => _cartItems;

  void addToCart(Map<String, String> book) {
    _cartItems.add(book);
    notifyListeners(); // Notify the UI to update
  }

  void removeFromCart(Map<String, String> book) {
    _cartItems.remove(book);
    notifyListeners();
  }
}
