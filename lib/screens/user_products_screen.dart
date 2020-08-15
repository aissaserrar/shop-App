import 'package:flutter/material.dart';
import 'package:my_shop/components/custom_drawer.dart';
import 'package:my_shop/components/user_product_item.dart';
import 'package:my_shop/providers/products.dart';
import 'package:my_shop/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static final String routeName = "/UserProductsScreen";
  @override
  Widget build(BuildContext context) {
    var productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User products'),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, EditProductScreen.routeName);
              }),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, index) => UserProductItem(
            productID: productsData.items[index].id,
            title: productsData.items[index].title,
            imageUrl: productsData.items[index].imageUrl,
          ),
        ),
      ),
    );
  }
}
