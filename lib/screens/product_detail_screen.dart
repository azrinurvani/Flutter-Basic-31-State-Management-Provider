import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/all_products.dart';
import 'package:provider/provider.dart';

//TODO - Step 7 - Buat UI untuk Detail Product dan tampilkan data menggunakan Provider
// Provider.of<Products>(context).findById(productId);
class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    // ...
    // final product = Provider.of<Products>(context)
    //     .allProducts
    //     .firstWhere((prodId) => prodId.id == productId);
    final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "${product.title}",
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "\$ ${product.price}",
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "${product.description}",
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
