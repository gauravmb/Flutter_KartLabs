import 'package:flutter/material.dart';
import 'package:kartlabs/view_model/categories_view_model.dart';
import 'package:kartlabs/widgets/category_item.dart';
import 'package:provider/provider.dart';

class CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<Categories>(context, listen: true);
    final categories = categoryData.items;
    return GridView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) => CategoryItem(category: categories[index]),
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ));
  }
}
