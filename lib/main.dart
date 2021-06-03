import 'package:flutter/material.dart';
import 'package:minha_loja/providers/cart.dart';
import 'package:minha_loja/providers/orders_provider.dart';
import 'package:minha_loja/views/cart_screen.dart';
import 'package:minha_loja/views/order_screen.dart';
import 'package:provider/provider.dart';

import '../utils/app_routes.dart';
import '../views/product_detail_scree.dart';
import '../views/products_overview_screen.dart';
import '../providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new Products()),
        ChangeNotifierProvider(create: (_) => new Cart()),
        ChangeNotifierProvider(create: (_) => new Orders()),
      ],
      // create: (_) => new Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
        ),
        home: ProducstOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART_SCREEN: (ctx) => CartScreen(),
          AppRoutes.ORDERS_SCREEN: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}
