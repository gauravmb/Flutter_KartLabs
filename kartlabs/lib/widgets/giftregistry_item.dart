import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/utility/constants.dart';
import 'package:kartlabs/view_model/giftregistry_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_share/flutter_share.dart';

class GiftRegistryItem extends StatelessWidget {
  final Product product;

  GiftRegistryItem({required this.product});

  Future<void> share(String title, String text, String link) async {
    await FlutterShare.share(
      title: title,
      text: text,
      linkUrl: link,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          leading: Container(
              height: double.infinity,
              width: 100,
              child: Image.network(product.thumbnailUrl)),
          title: Text(product.name),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      share(product.name, product.description,
                          product.thumbnailUrl);
                    },
                    icon: Icon(Icons.share)),
                IconButton(
                    onPressed: () {
                      Provider.of<GiftRegistry>(context, listen: false)
                          .removeProduct(product.name);
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
