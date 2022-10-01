import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/category.dart';
import 'package:kartlabs/screens/products_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductsScreen.routeName, arguments: {
            "category_id": category.categoryId,
          });
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightGreen.withOpacity(0.7), Colors.lightGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            category.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
