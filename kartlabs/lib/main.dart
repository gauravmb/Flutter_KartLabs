import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/cart.dart';
import 'package:kartlabs/view_model/categories_view_model.dart';
import 'package:kartlabs/view_model/giftregistry_view_model.dart';
import 'package:kartlabs/view_model/products_view_model.dart';
import 'package:kartlabs/view_model/wishlist_view_model.dart';
import 'package:kartlabs/screens/giftregistry_screen.dart';
import 'package:kartlabs/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './screens/cart_screen.dart';
import './screens/categories_screen.dart';
import './screens/products_screen.dart';
import './screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Categories()),
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Wishlist()),
        ChangeNotifierProvider(create: (ctx) => GiftRegistry())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: CategoryScreen(),
        routes: {
          ProductsScreen.routeName: (ctx) => ProductsScreen(),
          WishlistScreen.routeName: (ctx) => WishlistScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          GiftRegistryScreen.routeName: (ctx) => GiftRegistryScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen()
        },
      ),
    );
  }
}
