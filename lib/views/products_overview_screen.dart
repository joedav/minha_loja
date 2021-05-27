import 'package:flutter/material.dart';
import 'package:minha_loja/models/product.dart';
import 'package:minha_loja/data/dummy_data.dart';
import 'package:minha_loja/widgets/product_item.dart';

class ProducstOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = DUMMY_PRODUCST;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: EdgeInsets.all(10),
        // itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
        itemBuilder: (ctx, i) => ProductItem(loadedProducts[i]),
        itemCount: loadedProducts.length,
      ),
    );
  }
}
