import 'package:flutter/material.dart';
import '../widgets/appbarwithmenu.dart';

class GiftRegistryScreen extends StatefulWidget {
  static String routeName = '/giftregistry-screen';
  @override
  _GiftRegistryScreenState createState() => _GiftRegistryScreenState();
}

class _GiftRegistryScreenState extends State<GiftRegistryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gift Registry")),
      body: Center(
        child: Text("GiftRegistry items to come here.."),
      ),
    );
  }
}
