import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';

class Wishlist with ChangeNotifier {
  List<Product> _items = [];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(String name) {
    _items.removeWhere((element) => element.name == name);
    notifyListeners();
  }

  List<Product> get items {
    return _items;
  }
}
