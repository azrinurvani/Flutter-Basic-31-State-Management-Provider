import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/models/cart_item.dart';

//TODO - Step 15 - Create Cart Provider
class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {}; //empty value as initiator

  Map<String, CartItem>? get items => _items;

//TODO - Step 26 - Buat getter untuk mengambil jumlah dari items
  int get jumlah {
    return _items!.length;
  }

//TODO - Step 29 - Buat method untuk mendapatkan total harga dari keseluruhan item
  double get totalHarga {
    var total = 0.0;
    _items!.forEach((key, cartItem) {
      total += cartItem.qty! * cartItem.price!;
    });

    return total;
  }

  void addCart(String? productId, String? title, double? price) {
    if (_items!.containsKey(productId)) {
      //ketika sudah tersedia key product id
      _items!.update(
        productId!,
        (value) => CartItem(
          id: value.id,
          price: value.price,
          qty: value.qty! + 1,
          title: value.title,
        ), //yang diubah hanya qty
      );
    } else {
      //nambah product id baru jika _item.id tidak ada
      _items!.putIfAbsent(
        productId!,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          qty: 1,
          title: title,
        ),
      ); //akan menammbahkan ke _items jika key nya absent (tidak ada dalam item)
    }
    notifyListeners();
  }
}
