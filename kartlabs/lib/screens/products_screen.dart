import 'package:flutter/material.dart';
import 'package:kartlabs/widgets/product_list.dart';
import '../widgets/appbarwithmenu.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products-screen';
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final Map arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    String selectedCategoryID = "";
    String searchText = "";
    if (arguments['category_id'] != null) {
      selectedCategoryID = arguments['category_id'];
    } else {
      searchText = arguments['search_text'];
    }

    return Scaffold(
      appBar: AppBarWithMenu(
        title: Text(selectedCategoryID),
        context: context,
      ),
      body: selectedCategoryID != null && selectedCategoryID != "'"
          ? ProductList(selectedCategoryID, searchText)
          : ProductList(selectedCategoryID, searchText),
    );
  }
}
