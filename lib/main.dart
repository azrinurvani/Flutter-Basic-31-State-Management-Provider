import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/all_products.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Todo - Step 3 - Widget/UI yang menggunakan Provider mesti dibungkus dengan ChangeNotifierProvider
    // pada kondisi ini Widget/UI yang memerlukan data (product) adalah
    // List Product (ProductsOverviewScreen) dan Product Detail (ProductDetailScreen)
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber,
          ),
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
