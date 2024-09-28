import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier {
  static final ShoppingCart _instance = ShoppingCart._internal();
  factory ShoppingCart() {
    return _instance;
  }

  ShoppingCart._internal();

  List<Map<String, dynamic>> orderedItems = [];

  // Function to add an item or increase its quantity
  void addItem(Map<String, dynamic> item) {
    int index =
        orderedItems.indexWhere((element) => element['name'] == item['name']);

    if (index >= 0) {
      // Item already in cart, increase quantity
      orderedItems[index]['quantity']++;
      orderedItems[index]['totalPrice'] =
          orderedItems[index]['quantity'] * orderedItems[index]['price'];
    } else {
      // Item not in cart, add it with quantity 1
      orderedItems.add({
        'name': item['name'],
        'price': item['price'],
        'quantity': 1,
        'totalPrice': item['price'],
        'tags': item['tags'],
        'img': item['img'],
      });
    }

    notifyListeners();
  }

  // Function to decrease the quantity of an item
  void lessItem(Map<String, dynamic> item) {
    int index =
        orderedItems.indexWhere((element) => element['name'] == item['name']);

    if (index >= 0) {
      if (orderedItems[index]['quantity'] > 1) {
        // Decrease the quantity and update total price
        orderedItems[index]['quantity']--;
        orderedItems[index]['totalPrice'] =
            orderedItems[index]['quantity'] * orderedItems[index]['price'];
      } else {
        // If quantity is 1, remove the item from the cart
        orderedItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  // Get the total price of items in the cart
  double get totalCartPrice {
    return orderedItems.fold(0, (sum, item) => sum + item['totalPrice']);
  }
}
