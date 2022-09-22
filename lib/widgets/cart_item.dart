import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/cart.dart';
import 'package:provider/provider.dart';
class CartItem extends StatelessWidget {
  const CartItem({Key? key ,
      required this.id,  required this.productId ,required this.price, required this.quantity, required this.title}) : super(key: key);

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context, 
          builder: (ctx) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to remove the item from the cart'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                }, 
                child: const Text('No')),
                ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
                }, 
                child: const Text('Yes')),
                
            ],
          ));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child:  Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(child: Text('\$$price'))),            
              ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
