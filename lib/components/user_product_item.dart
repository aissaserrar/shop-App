import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Function removeProduct;
  final Function editProduct;
  UserProductItem({
    @required this.title,
    @required this.imageUrl,
    @required this.removeProduct,
    @required this.editProduct,
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
                  onPressed: editProduct,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: removeProduct,
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
