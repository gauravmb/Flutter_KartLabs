import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './product.dart';
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _products = [];

  Future<void> loadProducts() async {
    final value = await fetchProducts();
    _products = value;
    notifyListeners();
  }

  List<Product> get items {
    return _products;
  }

  Future<List<Product>> fetchProducts() async {
    final String response =
        await rootBundle.loadString("assets/samplejson/products.json");
    final data = await json.decode(response) as List<dynamic>;
    List<Product> productList = data.map((value) {
      return Product(
        price: value['product_price'],
        name: value['product_name'],
        description: value['product_description'],
        images: [],
        thumbnailUrl: value['product_thumnail_url'],
        categoryId: value['product_category_id'],
      );
    }).toList();
    return productList;
  }
}
