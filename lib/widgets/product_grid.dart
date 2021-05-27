import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Product> loadedProducts = Provider.of<Products>(context).items;
    final productsProvider = Provider.of<Products>(context);
    final products = productsProvider.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      // itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
      itemBuilder: (ctx, i) => ProductItem(products[i]),
      itemCount: products.length,
    );
  }
}
