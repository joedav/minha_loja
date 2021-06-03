import 'package:flutter/material.dart';
import 'package:minha_loja/providers/cart.dart';
import 'package:minha_loja/providers/orders_provider.dart';
import 'package:minha_loja/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Text(
                      'R\$${cart.totalAmont.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                  TextButton(
                    child: Text('Finalizar Compra'),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false)
                          .addOrder(cart);
                      cart.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItemWidget(
                cartItem: cartItems[i],
              ),
              itemCount: cart.itemsCount,
            ),
          ),
        ],
      ),
    );
  }
}
