import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/cart_screen.dart';
import 'package:flutter_application_3/widgets/app_drawer.dart';
import 'package:flutter_application_3/widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  favorites,
  all,
}
class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  late bool showFavorite = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.favorites) {
                    showFavorite = true;
                  } else {
                    showFavorite = false;
                  }
              });
              
            },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.favorites,
                    ),
                    const PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.all,
                    )
                  ]),
          Consumer<Cart> (
            builder: (_, cartData, ch) {
              return  Badge(
                child: ch!, 
                value: cartData.itemCount.toString());     
            },
            child: IconButton(
                icon: const Icon(Icons.shopping_cart), 
                onPressed: () { 
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                 },)
            )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(showFavorite),
    );
  }
}
