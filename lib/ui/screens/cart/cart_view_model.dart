import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/cartModel.dart';

class CartViewModel extends ChangeNotifier {
  // int _items = 1;
  final Map<String, Cart> _items = {};
  // final List _items = [];
  int itemAmount = 1;

  Map<String, Cart> get items {
    // ignore: recursive_getters
    return _items;
  }

  int get itemCount {
    return _items.length;
  }

  bool lable = false;
  bool get getlable {
    if (itemCount > 0) {
      lable = true;
    } else {
      lable = false;
    }
    return lable;
  }

  double total = 0.0;
  double get totalAmount {
    _items.forEach((key, cartItem) {
      total += (cartItem.price! * (cartItem.quantity)!.toDouble());
    });
    return total;
  }

  void addItem(String id, double price, String title, String ShortDesc,
      String imgUrl, int qunatity) {
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
                quantity: exitingCartItem.quantity! + qunatity,
              ));
    } else {
      _items.putIfAbsent(
          id,
          () => Cart(
              id: id,
              title: title,
              price: price,
              shortDesc: ShortDesc,
              imgUrl: imgUrl,
              quantity: qunatity));
    }
    notifyListeners();
  }

  void remove(String? id) {
    _items.remove(id);
    notifyListeners();
  }

  void findByIdIncrement(String id, int qunatity) {
    _items.update(
        id,
        (exitingCartItem) => Cart(
              // id: exitingCartItem.id,
              // title: exitingCartItem.title,
              // price: exitingCartItem.price,
              // imgUrl: exitingCartItem.imgUrl,
              // shortDesc: exitingCartItem.shortDesc,
              quantity: exitingCartItem.quantity! + 1,
            ));
    notifyListeners();
  }

  // void findByIdIdecrement(String? id) {
  //   final total = _plants.firstWhere((element) => element.id == id);
  //   total.qunatity--;
  //   notifyListeners();
  // }

  String findByIdShow(String? id) {
    final total = _items[id]?.quantity;
    // final total = _items.firstWhere((element) => element.id == id);
    return total.toString();
  }
}
