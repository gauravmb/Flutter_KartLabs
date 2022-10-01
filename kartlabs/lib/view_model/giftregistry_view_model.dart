import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GiftRegistry with ChangeNotifier {
  List<Product> _items = [];
  void addProduct(Product product) {
    _items.add(product);
    saveToDB();
    notifyListeners();
  }

  void removeProduct(String name) {
    _items.removeWhere((element) => element.name == name);
    saveToDB();
    notifyListeners();
  }

  List<Product> get items {
    if (_items.length == 0) {
      FetchFromDB().then((_) => notifyListeners());
    }
    return _items;
  }

  Future<void> saveToDB() async {
    String jsonItems = jsonEncode(_items);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("UserGiftregistry", jsonItems);
  }

  Future FetchFromDB() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("UserGiftregistry") == null) {
      return;
    }
    String jsonItems = prefs.getString("UserGiftregistry") as String;
    var itemsObjsJson = jsonDecode(jsonItems) as List;
    List<Product> items = itemsObjsJson
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    _items = items;
  }
}
