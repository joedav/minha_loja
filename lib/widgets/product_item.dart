import 'package:flutter/material.dart';
import 'package:minha_loja/providers/product.dart';
import 'package:minha_loja/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text(product.title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.of(context).pushNamed(
                      AppRoutes.PRODUCTS_FORM,
                      arguments: product,
                    ),
                icon: Icon(
                  Icons.edit_outlined,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete_outlined,
                )),
          ],
        ),
      ),
    );
  }
}
