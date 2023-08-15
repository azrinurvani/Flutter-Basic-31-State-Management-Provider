import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/all_products.dart';
import 'package:provider/provider.dart';

import './product_item.dart';

//TODO - Step 5 - Buatlah UI Builder untuk menampung ProductItem dalam bentuk Grid dengan menggunakan method
// Provider.of<Models>(context) sebagai penyedia data --> memanggil getter dari Provider (Products)
class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allProduct = productData.allProducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //TODO - Step 9 - Bungkus ProductItem menggunakan ChangeNotifierProvider.value()
        //karena data yang di buat adalah data value bukan object class
        value: allProduct[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
