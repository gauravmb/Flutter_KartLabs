import 'package:flutter/material.dart';
import '../widgets/appbarwithmenu.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products-screen';
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithMenu(
        title: Text("Products"),
        context: context,
      ),
      body: Center(
        child: Text("Products to come here.."),
      ),
    );
  }
}
