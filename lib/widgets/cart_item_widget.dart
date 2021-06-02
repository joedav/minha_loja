import 'package:flutter/material.dart';
import 'package:minha_loja/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem? cartItem;

  const CartItemWidget({
    Key? key,
    this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem!.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem!.productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(
                  5,
                ),
                child: FittedBox(
                  child: Text('${cartItem!.price}'),
                ),
              ),
            ),
            title: Text(cartItem!.title),
            subtitle: Text(
              'Total: R\$${cartItem!.price * cartItem!.quantity}',
            ),
            trailing: Text('${cartItem!.quantity}x'),
          ),
        ),
      ),
    );
  }
}
