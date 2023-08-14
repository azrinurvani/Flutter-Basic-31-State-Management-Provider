import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

//TODO - Step 6 - Implement ProductGrid pada ProductsOverViewScreen
class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: const ProductGrid(),
    );
  }
}
