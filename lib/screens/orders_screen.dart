import 'package:flutter/material.dart';
import 'package:my_shop/components/custom_drawer.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static final String routeName = "/OrdersScreen";
  @override
  Widget build(BuildContext context) {
    var orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: orders.orders.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                '${orders.orders[index].amount} \$',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(
                  '${orders.orders[index].dateTime.day}/${orders.orders[index].dateTime.month}/${orders.orders[index].dateTime.year}'),
              children: [
                for (var product in orders.orders[index].products)
                  ListTile(
                    title: Text(
                      '${product.title}',
                      style: TextStyle(fontSize: 24),
                    ),
                    subtitle: Text('${product.price} \$ x ${product.quantity} Pcs'),
                    trailing: Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        '${(product.price * product.quantity)} \$',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
