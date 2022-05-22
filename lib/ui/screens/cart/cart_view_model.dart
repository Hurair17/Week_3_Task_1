import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/cartModel.dart';

class CartViewModel extends ChangeNotifier {
  // int _items = 1;
  final Map<String, Cart> _items = {};
  // final List _items = [];

  Map<String, Cart> get items {
    // ignore: recursive_getters
    return _items;
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.price! * (cartItem.quantity)!.toDouble());
    });
    return total;
  }

  void addItem(
      String id, double price, String title, String ShortDesc, String imgUrl) {
    // Check it the items is already Present in the Cart
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (exitingCartItem) => Cart(
                id: exitingCartItem.id,
                title: exitingCartItem.title,
                price: exitingCartItem.price,
                imgUrl: exitingCartItem.imgUrl,
                shortDesc: exitingCartItem.shortDesc,
                quantity: exitingCartItem.quantity! + 1,
              ));
    } else {
      _items.putIfAbsent(
          id,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              shortDesc: ShortDesc,
              imgUrl: imgUrl,
              quantity: 1));
    }
    notifyListeners();
  }
}
