import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/view_model/products_view_model.dart';
import 'package:kartlabs/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  String? _selectedCategoryId;
  String? _searchText;

  ProductList(String selectedCategoryId, String searchText) {
    _searchText = searchText;
    _selectedCategoryId = selectedCategoryId;
  }

  @override
  Widget build(BuildContext context) {
    print(_searchText);
    final List<Product> products =
        Provider.of<Products>(context, listen: true).items;
    List<Product> filteredProducts = [];

    if (_selectedCategoryId != null && _selectedCategoryId != "") {
      filteredProducts = products
          .where((product) => product.categoryId == _selectedCategoryId)
          .toList();
    } else {
      filteredProducts = products
          .where((product) =>
              product.name.toLowerCase().contains(_searchText!.toLowerCase()) ||
              product.description
                  .toLowerCase()
                  .contains(_searchText!.toLowerCase()))
          .toList();
    }

    return filteredProducts.length > 0
        ? ListView.builder(
            itemCount: filteredProducts.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) =>
                ProductItem(product: filteredProducts[index]),
          )
        : Center(
            child: Text("No Product available for the selected search ...!!!"),
          );
  }
}
