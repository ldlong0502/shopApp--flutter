import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/orders.dart';
import 'package:flutter_application_3/screens/cart_screen.dart';
import 'package:flutter_application_3/screens/orders_screen.dart';
import 'package:provider/provider.dart';
import 'providers/cart.dart';
import 'screens/products_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import 'providers/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products()),
          ChangeNotifierProvider.value(
            value: Cart()),
          ChangeNotifierProvider.value(
            value: Orders(),
          )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen()
        },
      ),
    );
  }
}
