import 'package:flutter/material.dart';
import 'package:minha_loja/providers/cart.dart';
import 'package:minha_loja/utils/app_routes.dart';
import 'package:minha_loja/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProducstOverviewScreen extends StatefulWidget {
  @override
  _ProducstOverviewScreenState createState() => _ProducstOverviewScreenState();
}

class _ProducstOverviewScreenState extends State<ProducstOverviewScreen> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    // final Products products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  // products.showFavoriteOnly();
                  _showFavoriteOnly = true;
                } else {
                  // products.showAll();
                  _showFavoriteOnly = false;
                }
              });
            },
            // icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            // child: IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.shopping_cart),
            // ),
            builder: (_, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              // child: child,
              child: IconButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  AppRoutes.CART_SCREEN,
                ),
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
