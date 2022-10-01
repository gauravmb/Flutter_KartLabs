import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/utility/constants.dart';
import 'package:kartlabs/view_model/cart_view_model.dart';
import 'package:kartlabs/view_model/wishlist_view_model.dart';
import 'package:provider/provider.dart';

class CartOrWishlistItem extends StatelessWidget {
  final ProductContainerType containerType;
  final Product product;

  CartOrWishlistItem({required this.containerType, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          leading: Container(
              height: double.infinity,
              width: 100,
              child: Image.network(product.thumbnailUrl)),
          title: Text(product.name),
          subtitle: Text(
            product.price,
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
          trailing: IconButton(
              onPressed: () {
                switch (containerType) {
                  case ProductContainerType.Wishlist:
                    Provider.of<Wishlist>(context, listen: false)
                        .removeProduct(product.name);
                    break;
                  case ProductContainerType.GiftRegistry:
                    // TODO: Handle this case.
                    break;
                  case ProductContainerType.Cart:
                    Provider.of<Cart>(context, listen: false)
                        .removeProduct(product.name);
                    break;
                }
              },
              icon: Icon(Icons.delete)),
        )
      ],
    ));
  }
}
