import 'package:flutter/material.dart';
import 'package:my_shop/components/badge.dart';
import 'package:my_shop/components/custom_drawer.dart';
import 'package:my_shop/components/products_grid.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:provider/provider.dart';

enum DisplayOptions {
  favorites,
  all,
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DisplayOptions displayOptions = DisplayOptions.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            offset: Offset(0, 55),
            onSelected: (value) {
              setState(
                () {
                  displayOptions = value;
                },
              );
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: DisplayOptions.favorites,
                child: Text('Favorites only'),
              ),
              PopupMenuItem(
                value: DisplayOptions.all,
                child: Text('Show all'),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
//              value: cart.itemsCount == null ? "0" : cart.itemsCount.toString(),
              value: cart.productsInCard.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: ProductsGrid(displayOptions),
    );
  }
}
