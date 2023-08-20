import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/cart.dart';
import 'package:provider/provider.dart';

//TODO - Step 22 - Buat Cart Screen untuk tampilan Cart yang ditambahkan
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    //TODO - Step 29 - Panggil provider cart
    final cartData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      //TODO - Step 30 - Buat Widget pada bagian body untuk menampilkan data Cart di CartScreen
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Total : \$ ${cartData.totalHarga}",
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "Judul Product : ${cartData.items!.values.toList()[index].title}",
                  ),
                  subtitle: Text(
                    "Quantity : ${cartData.items!.values.toList()[index].qty}",
                  ),
                  trailing: Container(
                    child: Text(
                      "\$ ${cartData.items!.values.toList()[index].price! * cartData.items!.values.toList()[index].qty!} ",
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
