import 'package:flutter/material.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:my_shop/screens/orders_screen.dart';
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
          DrawerHeader(
            child: Text('Shop'),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
            child: ListTile(
              title: Text('My Orders'),
              trailing: Chip(
                label: Text(
                  '${Provider.of<Orders>(context).orders.length}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
