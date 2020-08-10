import 'package:flutter/material.dart';
import 'package:my_shop/components/cart_item.dart';
import 'package:my_shop/providers/cart.dart' as cartModel;
//import 'package:my_shop/providers/cart.dart' show Cart;
import 'package:my_shop/providers/orders.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static final routeName = "/CartScreen";
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<cartModel.Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Card'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '${cart.totalPrice.toStringAsFixed(2)} \$',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryTextTheme.headline6.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      onPressed: () {
                        if (cart.totalPrice > 0) {
                          Provider.of<Orders>(context, listen: false)
                              .addOrder(cart.items.values.toList(), cart.totalPrice);
                          cart.clear();
                        }
                      },
                      child: Text(
                        'Order Now'.toUpperCase(),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemsCount,
                itemBuilder: (context, index) => CartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].title,
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
