import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/cart.dart';
import 'package:flutter_application_3/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({ Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 400,
              ),
        ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: Consumer<Product>(
          builder: ((ctx, product, _) {
            print(Theme.of(context).primaryColor);
            return IconButton(
            icon:  Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border), 
            onPressed: () {
              product.toggleFavoriteStatus();
            },
            color: Theme.of(context).primaryColor,
          );
          }), 
        ),
        trailing:  IconButton(
          icon:  const Icon(Icons.shopping_cart), 
          onPressed: () {
                cart.addItem(product.id, product.title, product.price);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Added item to cart', textAlign: TextAlign.center,),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(label: 'UNDO', onPressed: () {
                      cart.removeSingleItem(product.id);
                    }),
                    ),
                  
                  );

              },
          color:  Theme.of(context).primaryColor,
        ),
          title: Text(product.title, textAlign: TextAlign.center,)
      ),
      ),
    );
  }
}