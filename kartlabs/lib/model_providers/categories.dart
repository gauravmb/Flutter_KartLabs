import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './category.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get items {
    return _categories;
  }

  Future<void> loadCategories() async {
    final value = await _fetchCategories();
    _categories = value;
    notifyListeners();
  }

  Future<List<Category>> _fetchCategories() async {
    final String response =
        await rootBundle.loadString("assets/samplejson/categories.json");
    final data = await json.decode(response) as List<dynamic>;
    List<Category> categoryList = data.map((value) {
      return Category(
          categoryId: value['category_id'], title: value['category_title']);
    }).toList();
    return categoryList;
  }
}
