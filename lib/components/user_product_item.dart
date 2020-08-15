import 'package:flutter/material.dart';
import 'package:my_shop/providers/products.dart';
import 'package:my_shop/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String productID;
  final String title;
  final String imageUrl;
  UserProductItem({
    @required this.productID,
    @required this.title,
    @required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          trailing: Container(
            width: MediaQuery.of(context).size.width * .3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      EditProductScreen.routeName,
                      arguments: productID,
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    Provider.of<Products>(context, listen: false).removeProduct(productID);
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
