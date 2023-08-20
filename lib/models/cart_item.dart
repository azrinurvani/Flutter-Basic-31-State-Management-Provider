//TODO - Step 14 - Create Models CartItem
import 'package:flutter/material.dart';

class CartItem {
  final String? id;
  final String? title;
  final double? price;
  final int? qty;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.qty,
    @required this.title,
  });
}
