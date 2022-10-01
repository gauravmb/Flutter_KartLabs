import 'package:flutter/material.dart';
import 'package:kartlabs/model_providers/product.dart';
import 'package:kartlabs/utility/constants.dart';
import 'package:provider/provider.dart';

class CartOrWishlistItem extends StatelessWidget {
  final ProductContainerType containerType;
  final Product product;

  CartOrWishlistItem({required this.containerType, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(product.name),
    );
  }
}
