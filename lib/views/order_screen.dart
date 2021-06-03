import 'package:flutter/material.dart';
import 'package:minha_loja/providers/orders_provider.dart';
import 'package:minha_loja/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderWidget(
          order: orders.orders[i],
        ),
        itemCount: orders.ordersCount,
      ),
    );
  }
}
