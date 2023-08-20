import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/cart.dart';
import 'package:flutter_basic_31_state_provider/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';

//TODO - Step 6 - Implement ProductGrid pada ProductsOverViewScreen
class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        //TODO - Step 21 - Tambahkan action bar dari BadgetWidget
        actions: [
          //TODO - Step 27 - Bungkus BadgetWidget dengan Consumer
          Consumer<Cart>(
            builder: (context, value, ch) {
              return BadgeWidget(
                value: value.jumlah.toString(),
                child: ch,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
