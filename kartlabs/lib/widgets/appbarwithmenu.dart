import 'package:flutter/material.dart';
import 'package:kartlabs/screens/cart_screen.dart';
import 'package:kartlabs/screens/giftregistry_screen.dart';
import 'package:kartlabs/screens/wishlist_screen.dart';
import '../utility/constants.dart';

class AppBarWithMenu extends AppBar {
  AppBarWithMenu(
      {Key? key, required Widget title, required BuildContext context})
      : super(
          key: key,
          title: title,
          actions: [
            PopupMenuButton(
                onSelected: (ProductContainerType selectedOption) {
                  switch (selectedOption) {
                    case ProductContainerType.Wishlist:
                      {
                        Navigator.of(context)
                            .pushNamed(WishlistScreen.routeName);
                      }
                      break;
                    case ProductContainerType.GiftRegistry:
                      {
                        Navigator.of(context)
                            .pushNamed(GiftRegistryScreen.routeName);
                      }
                      break;
                    default:
                      // TODO: Handle this case.
                      break;
                  }
                },
                itemBuilder: (cxt) => const [
                      PopupMenuItem(
                        child: Text("My Wishlist"),
                        value: ProductContainerType.Wishlist,
                      ),
                      PopupMenuItem(
                        child: Text("Gift Registry"),
                        value: ProductContainerType.GiftRegistry,
                      )
                    ]),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: Icon(Icons.shopping_cart))
          ],
        );
}
