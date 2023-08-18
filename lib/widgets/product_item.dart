import 'package:flutter/material.dart';
import 'package:flutter_basic_31_state_provider/providers/product.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

//TODO - Step 4 - Buat lah UI untuk menampilkan List dari Product menggunakan GridTile
class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    //listen set false agar tidak membuang memory lebih banyak
    final productData = Provider.of<Product>(context, listen: false);
    print("Widget Rebuild");

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            //TODO - Step 13 - Bungkus Widget favorite dengan Consumer
            //Consumer itu set context nya selalu listen (secara default selalu dibikin true)
            // yang dibungkus icon favorite saja karena yang butuh listen UI adalah widget fav
            builder: (context, productData, child) => IconButton(
              icon: productData
                      .isFavorite //TODO - Step 11 - Buat logic untuk merubah icon favorit ketika di klik
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                //TODO - Step 12 - Panggil method setStatus ketika tombol favorit di klik
                productData.setStatus();
              },
            ),
          ),
          title: Text(
            productData.title.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
