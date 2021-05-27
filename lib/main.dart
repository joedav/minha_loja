import 'package:flutter/material.dart';
import 'package:minha_loja/utils/app_routes.dart';
import 'package:minha_loja/views/product_detail_scree.dart';
import 'package:minha_loja/views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      routes: {
        AppRoutes.HOME: (ctx) => ProducstOverviewScreen(),
        AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
