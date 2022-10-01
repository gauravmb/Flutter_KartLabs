import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    Map arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Product selectedProduct = arguments['selectedProduct'] as Product;
    return Scaffold(
      appBar: AppBar(title: Text(selectedProduct.name)),
      body: Column(
        children: [
          Center(
            child: Text(selectedProduct.description),
          ),
          FlatButton(onPressed: () {}, child: Text("Add to Gift Registry")),
          FlatButton(onPressed: () {}, child: Text("Add to Cart")),
          FlatButton(onPressed: () {}, child: Text("Add to Wishlish"))
        ],
      ),
    );
  }
}
