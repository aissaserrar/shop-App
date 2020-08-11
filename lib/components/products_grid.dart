import 'package:flutter/material.dart';
import 'package:my_shop/components/product_item.dart';
import 'package:my_shop/providers/products.dart';
import 'package:my_shop/screens/home_screen.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final DisplayOptions _displayOptions;
  ProductsGrid(this._displayOptions);

  @override
  Widget build(BuildContext context) {
    var prods = _displayOptions == DisplayOptions.all
        ? Provider.of<Products>(context, listen: false).items
        : Provider.of<Products>(context, listen: false).favoriteItems;
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: prods.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: prods[index],
        child: ProductItem(),
      ),
    );
  }
}
