import 'package:flutter/material.dart';
import 'package:minha_loja/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        title: Text(product.title),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {},
        ),
      ),
    );
  }
}
