import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_3/providers/orders.dart' show Orders;
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({ Key? key }) : super(key: key);
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx , i) => OrderItem(order: orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
      drawer: const AppDrawer(),
      
    );
  }
}