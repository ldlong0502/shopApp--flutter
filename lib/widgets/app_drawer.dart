import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(children: <Widget>[
        AppBar(title: const Text('Hello Friend'),
        automaticallyImplyLeading: false,),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shop_2_rounded),
          title: const Text('Shop'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        const Divider(),
         ListTile(
          leading: const Icon(Icons.payment),
          title: const Text('Payment'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
         ),
      ]),
    );
  }
}