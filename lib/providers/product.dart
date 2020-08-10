import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isFavorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    this.isFavorite = !this.isFavorite;
    notifyListeners();
  }
}
