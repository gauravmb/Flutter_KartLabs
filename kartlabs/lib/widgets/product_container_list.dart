import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/cart.dart';
import 'package:kartlabs/view_model/giftregistry_view_model.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/view_model/wishlist_view_model.dart';
import 'package:kartlabs/utility/constants.dart';
import 'package:kartlabs/widgets/cart_wishlist_item.dart';
import 'package:kartlabs/widgets/giftregistry_item.dart';
import 'package:provider/provider.dart';

class ProductContainerList extends StatelessWidget {
  final ProductContainerType containerType;

  ProductContainerList({required this.containerType});

  @override
  Widget build(BuildContext context) {
    List<Product> items = [];
    switch (containerType) {
      case ProductContainerType.Cart:
        {
          items = Provider.of<Cart>(context).items;
        }
        break;
      case ProductContainerType.Wishlist:
        {
          items = Provider.of<Wishlist>(context).items;
        }
        break;
      case ProductContainerType.GiftRegistry:
        {
          items = Provider.of<GiftRegistry>(context).items;
        }
        break;
    }
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) =>
            containerType == ProductContainerType.GiftRegistry
                ? GiftRegistryItem(
                    product: items[index],
                  )
                : CartOrWishlistItem(
                    containerType: containerType,
                    product: items[index],
                  ));
  }
}
