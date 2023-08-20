import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/all_products.dart';
import 'package:flutter_basic_31_state_provider/providers/cart.dart';
import 'package:flutter_basic_31_state_provider/screens/cart_screen.dart';
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

    //TODO - Step 16 - Ganti ChangeNotifierProvider dengan MultiProvider karena menggunakan lebih dari satu provider
    //yaitu Cart dan Product
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
      ],
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
          //TODO - Step 23 - Daftarkan routing untuk navigate ke CartScreen
          CartScreen.routeName: (ctx) => CartScreen()
        },
      ),
    );
  }
}

//contoh penggunakan spread collection [...list]
class ScreenSpreadListExample extends StatelessWidget {
  ScreenSpreadListExample({super.key});

  List<Text> myList = List.generate(
    25,
    (index) => Text(
      "${index + 1}",
      style: const TextStyle(
        fontSize: 35,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spread Collection Example"),
      ),
      body: ListView(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.amber,
          ),
          ...myList,
        ],
      ),
    );
  }
}
