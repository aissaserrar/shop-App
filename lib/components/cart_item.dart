import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productID;
  final String title;
  final double price;
  final int quantity;

  CartItem(
    this.id,
    this.productID,
    this.title,
    this.price,
    this.quantity,
  );
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      onDismissed: (direction) {
        cart.removeItem(productID);
//        cart.removeItemFromQuantity(productID);
      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: Text('$title'),
            subtitle: Text('Total ${(price * quantity)} \$'),
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(child: Text('$price \$')),
              ),
            ),
            trailing: Text(
              '$quantity x',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
