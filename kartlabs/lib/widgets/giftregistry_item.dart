import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/utility/constants.dart';
import 'package:provider/provider.dart';

class GiftRegistryItem extends StatelessWidget {
  final Product product;

  GiftRegistryItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.name),
    );
  }
}
