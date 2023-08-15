import 'package:flutter/material.dart';
import 'product.dart';
import 'dart:math';

//TODO - Step 2 - Buat getter and setter (provider) dari list product yang akan digunakan pada provider
class Products with ChangeNotifier {
  final List<Product> _allProducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get allProducts {
    return [
      ..._allProducts
    ]; //... (titik tiga) adalah spread collections agar posisi list bisa diatur sesuai yang diinginkan
    //example : [listA, ..._alProducts, listB]
  }

  Product findById(productId) {
    return _allProducts.firstWhere((prod) => prod.id == productId);
  }
}
