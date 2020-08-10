import 'package:flutter/material.dart';
import 'package:my_shop/providers/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  static final String routeName = "/ProductDetailsScreen";

  @override
  Widget build(BuildContext context) {
    final Product _product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _product.title,
                  softWrap: true,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                  ),
                ),
                Icon(
                  _product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 28,
                  color: _product.isFavorite ? Theme.of(context).accentColor : Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .3,
            child: Image.network(
              _product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              '${_product.price} \$',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(_product.description),
          ),
        ],
      ),
    );
  }
}
