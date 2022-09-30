import 'package:flutter/material.dart';
import '../widgets/appbarwithmenu.dart';

class WishlistScreen extends StatefulWidget {
  static String routeName = '/wishlist-screen';
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
      body: Center(
        child: Text("Wishlist items to come here.."),
      ),
    );
  }
}
