import 'package:flutter/material.dart';
import '../widgets/appbarwithmenu.dart';

class CategoryScreen extends StatefulWidget {
  static String routeName = '/';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithMenu(title: Text("Home"), context: context),
      body: Center(
        child: Text("Categories to come here.."),
      ),
    );
  }
}
