import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/cart.dart';
import 'package:kartlabs/model_providers/giftregistry.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/model_providers/wishlist.dart';
import 'package:kartlabs/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: {'selectedProduct': product});
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    product.thumbnailUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .addProduct(product);
                    },
                    icon: Icon(Icons.shop)),
                IconButton(
                    onPressed: () {
                      Provider.of<Wishlist>(context, listen: false)
                          .addProduct(product);
                    },
                    icon: Icon(Icons.watch_later)),
                IconButton(
                    onPressed: () {
                      Provider.of<GiftRegistry>(context, listen: false)
                          .addProduct(product);
                    },
                    icon: Icon(Icons.wallet_giftcard))
              ],
            )
          ],
        ),
      ),
    );
  }
}
