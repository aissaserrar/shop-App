import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  //number of distinct products in the cart
  int get itemsCount => _items.length;

  //number of products in the card including duplicated products
  int get productsInCard {
    int total = 0;
    _items.forEach((key, value) {
      total += value.quantity;
    });
    return total;
  }

  //return the total price
  double get totalPrice {
    double totalPrice = 0;
    _items.forEach((key, value) {
      totalPrice += value.price * value.quantity;
    });
    return totalPrice;
  }

  void addItemToCard(String productID, double price, String title) {
    if (_items.containsKey(productID)) {
      _items.update(
        productID,
        (existingCardItem) => CartItem(
          id: existingCardItem.id,
          title: existingCardItem.title,
          price: existingCardItem.price,
          quantity: existingCardItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productID,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productID) {
    _items.remove(productID);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
//
//  void removeItemFromQuantity(String productID) {
//    if (_items[productID].quantity == 1) {
//      _items.remove(productID);
//    } else {
//      _items.update(
//          productID,
//          (old) =>
//              CartItem(id: old.id, title: old.title, price: old.price, quantity: old.quantity - 1));
//    }
//    notifyListeners();
//  }
}
