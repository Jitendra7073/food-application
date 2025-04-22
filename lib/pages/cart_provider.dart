import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> food, int quantity) {
    final existingIndex =
        _items.indexWhere((item) => item['name'] == food['name']);

    if (existingIndex >= 0) {
      _items[existingIndex]['quantity'] += quantity;
    } else {
      _items.add({
        'name': food['name'],
        'price': food['price'],
        'image': food['image'],
        'quantity': quantity,
      });
    }
    notifyListeners();
  }

  int get totalPrice => _items.fold(
      0, (sum, item) => sum + (item['price'] * item['quantity'] as int));

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
