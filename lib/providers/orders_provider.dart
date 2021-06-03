import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:minha_loja/providers/cart.dart';

class Order {
  final String? id;
  final double? total;
  final List<CartItem>? products;
  final DateTime? date;

  Order({
    this.total,
    this.date,
    this.id,
    this.products,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get ordersCount {
    return _orders.length;
  }

  void addOrder(Cart cart) {
    // final combine = (t, i) => t + (i.price * i.quantity);
    // final total = products.fold(0.00, combine);

    _orders.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmont,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
