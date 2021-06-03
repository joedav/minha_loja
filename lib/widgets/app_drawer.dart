import 'package:flutter/material.dart';
import 'package:minha_loja/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Bem-Vindo Usuário!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_2_outlined),
            title: Text('Loja'),
            onTap: () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          ListTile(
            leading: Icon(Icons.card_membership),
            title: Text('Meus Pedidos'),
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoutes.ORDERS_SCREEN),
          )
        ],
      ),
    );
  }
}
