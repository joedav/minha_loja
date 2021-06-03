import 'package:flutter/material.dart';
import 'package:minha_loja/providers/products.dart';
import 'package:minha_loja/widgets/app_drawer.dart';
import 'package:minha_loja/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemBuilder: (ctx, i) => SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductItem(product: products[i]),
                      Divider(),
                    ],
                  ),
                ),
            itemCount: productsData.itemsCount),
      ),
    );
  }
}
