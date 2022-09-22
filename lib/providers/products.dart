import 'package:flutter/cupertino.dart';

import 'product.dart';
class Products with ChangeNotifier{
  final List<Product> _items = [
    Product(
        id: '1',
        description: 'Flavorful',
        title: 'Pasta',
        price: 49.99,
        imageUrl:
            'https://cdn.icon-icons.com/icons2/236/PNG/256/Dish_Pasta_Spaghetti_26373.png'),
            Product(
        id: '2',
        description: 'Flavorful',
        title: 'Pasta',
        price: 49.99,
        imageUrl:
            'https://cdn.icon-icons.com/icons2/236/PNG/256/Dish_Pasta_Spaghetti_26373.png'),
            Product(
        id: '3',
        description: 'Flavorful',
        title: 'Pasta',
        price: 49.99,
        imageUrl:
            'https://cdn.icon-icons.com/icons2/236/PNG/256/Dish_Pasta_Spaghetti_26373.png'),
            Product(
        id: '4',
        description: 'Flavorful',
        title: 'Pasta',
        price: 49.99,
        imageUrl:
            'https://cdn.icon-icons.com/icons2/236/PNG/256/Dish_Pasta_Spaghetti_26373.png'),
  ];

  List<Product> get items{
    return [..._items];

  }

  List<Product> get favoriteItems {
    return items.where((element) => element.isFavorite).toList();
  }
  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }
  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}