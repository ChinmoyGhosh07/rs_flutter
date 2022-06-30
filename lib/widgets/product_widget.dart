import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ProductWidget extends StatelessWidget {

  final Product product;

  const ProductWidget({Key? key,required this.product})
      : assert(product != null),
        super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.productImage),
      title: Text(product.displayName),
      trailing: Text("\$${product.mrp}"),
    );
  }
}


