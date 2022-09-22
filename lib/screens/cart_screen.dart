import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/orders.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(children: <Widget>[
                const Text('Total', style:  TextStyle(fontSize: 20),),
                const SizedBox(width: 10,),
                Spacer(),
                Chip(
                  label: Text('\$${cart.totalAmount.toStringAsFixed(2)}'),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                ElevatedButton(
                  onPressed: (){
                    Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                    cart.clear();
                  }, 
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0
                  ),
                  child: const Text('ORDER NOW', style: TextStyle(
                    color: Colors.blue 
                  ),)),
      
              ]),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: ListView.builder(
            itemBuilder: (ctx, i) => 
              CartItem(
                id: cart.items.values.toList()[i].id, 
                productId: cart.items.keys.toList()[i],
                title: cart.items.values.toList()[i].title, 
                quantity: cart.items.values.toList()[i].quantity, 
                price: cart.items.values.toList()[i].price), 
            itemCount: cart.items.length,
            
            )),
        ],
      ),
    );
  }
}