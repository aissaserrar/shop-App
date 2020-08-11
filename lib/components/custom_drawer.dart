import 'package:flutter/material.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:my_shop/screens/orders_screen.dart';
import 'package:my_shop/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            title: Text(
              'My Shop',
            ),
            automaticallyImplyLeading: false,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: ListTile(
              title: Text(
                'Shop',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.shop,
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
            child: ListTile(
              title: Text(
                'My Orders',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Chip(
                label: Text(
                  '${Provider.of<Orders>(context).orders.length}',
                ),
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
            child: ListTile(
              title: Text(
                'Manage products',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
