import 'package:flutter/material.dart';
import 'package:kartlabs/utility/constants.dart';
import 'package:kartlabs/widgets/product_container_list.dart';
import '../widgets/appbarwithmenu.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/cart-screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: ProductContainerList(containerType: ProductContainerType.Cart),
    );
  }
}
