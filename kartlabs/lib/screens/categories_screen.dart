import 'package:flutter/material.dart';
import 'package:kartlabs/view_model/categories_view_model.dart';
import 'package:kartlabs/view_model/products_view_model.dart';
import 'package:kartlabs/screens/products_screen.dart';
import 'package:kartlabs/widgets/category_grid.dart';
import '../widgets/appbarwithmenu.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  static String routeName = '/';
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _isLoading = false;
  bool _isFirstLoad = true;

  final searchTextController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchTextController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isFirstLoad) {
      Provider.of<Categories>(context, listen: false)
          .loadCategories()
          .then((_) {
        Provider.of<Products>(context, listen: false).loadProducts().then((_) {
          _isLoading = false;
        });
      });
      _isFirstLoad = false;
    }
    super.didChangeDependencies();
  }

  launchSearchScreen(String searchText, BuildContext context) {
    searchTextController.clear();
    Navigator.of(context).pushNamed(ProductsScreen.routeName, arguments: {
      "search_text": searchText,
    });
  }

  final Categories categories = Categories();
  final Products products = Products();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithMenu(title: Text("Home"), context: context),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // If you want align text to left
                      children: [
                        TextField(
                          onSubmitted: (_) {
                            launchSearchScreen(
                                searchTextController.text, context);
                          },
                          controller: searchTextController,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    launchSearchScreen(
                                        searchTextController.text, context);
                                  }),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: CategoryGrid()),
              ],
            ),
    );
  }
}




      //  Container(
      //             height: 50,
      //             width: double.infinity,
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                       child: TextField(
      //                     textAlignVertical: TextAlignVertical.bottom,
      //                     decoration: InputDecoration(
      //                       prefixIcon: Icon(Icons.search),
      //                       border: OutlineInputBorder(),
      //                       hintText: 'Search Products',
      //                     ),
      //                   )),
      //                 ],
      //               ),
      //             ),
      //           )