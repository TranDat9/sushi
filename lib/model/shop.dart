import 'package:first_app/model/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "21.00",
        imagePath: 'lib/images/sushi_rice_black.png',
        rating: "4.5"),
    Food(
        name: "Tuna Sushi",
        price: "23.00",
        imagePath: 'lib/images/sushi_three_egg.png',
        rating: "4.9")
  ];

  // CUTOMER CART
  List<Food> _cart = [];
  // getter method
  List<Food> get cart => _cart;
  List<Food> get foodMenu => _foodMenu;
  // add to cart
  void addToCart(Food foodItems, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItems);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food foodItems) {
    _cart.remove(foodItems);
    notifyListeners();
  }
}
