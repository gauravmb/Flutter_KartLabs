import 'package:flutter/material.dart';
import '../widgets/appbarwithmenu.dart';
import '../widgets/product_container_list.dart';
import '../utility/constants.dart';

class WishlistScreen extends StatefulWidget {
  static String routeName = '/wishlist-screen';
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: ProductContainerList(containerType: ProductContainerType.Wishlist),
    );
  }
}
