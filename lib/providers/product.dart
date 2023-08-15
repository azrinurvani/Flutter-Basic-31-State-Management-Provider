import 'package:flutter/foundation.dart';

//TODO - Step 1 - Buat lah data class/model (Product)
//TODO - Step 8 - Tambahkan ChangeNotifer pada class Product, dan pindahkan ke package Providers
class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  //TODO - Step 10 - Buat method untuk merubah status favourite
  void setStatus() {
    this.isFavorite = !this.isFavorite;
    notifyListeners(); //merubah data ke UI, berasa statefull
  }
}
