import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/cart.dart';
import 'package:kartlabs/view_model/giftregistry_view_model.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/view_model/wishlist_view_model.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = "/product-detail";
  @override
  Widget build(BuildContext context) {
    Map arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Product selectedProduct = arguments['selectedProduct'] as Product;
    return Scaffold(
      appBar: AppBar(title: Text(selectedProduct.name)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Positioned(
          bottom: 0,
          top: 0,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Image.network(selectedProduct.thumbnailUrl),
              Center(
                child: Text(
                  selectedProduct.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Divider(),
              Center(
                child: Text(selectedProduct.description),
              ),
              SizedBox(
                height: 10,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                          onPressed: () {
                            Provider.of<GiftRegistry>(context, listen: false)
                                .addProduct(selectedProduct);
                          },
                          child: const Text(
                            "Gift Registry",
                            textAlign: TextAlign.center,
                          )),
                      FlatButton(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addProduct(selectedProduct);
                          },
                          child: Text(
                            "Cart",
                            textAlign: TextAlign.center,
                          )),
                      FlatButton(
                          onPressed: () {
                            Provider.of<Wishlist>(context, listen: false)
                                .addProduct(selectedProduct);
                          },
                          child: Text(
                            "Wishlish",
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
