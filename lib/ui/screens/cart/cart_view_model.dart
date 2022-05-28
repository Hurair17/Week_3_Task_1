import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/amount_model.dart';
import 'package:week_3_task/core/models/plant.dart';

class CartViewModel extends ChangeNotifier {
  // int _items = 1;
  final Map<String, Plant> _items = {};
  // final List _items = [];
  int itemAmount = 1;

  Map<String, Plant> get items {
    // ignore: recursive_getters
    return _items;
  }

  // List get items
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

  final _amount = TotalAmount();
  double get totalAmount {
    double total = _amount.subTotal;
    _items.forEach((key, cartItem) {
      // print(key);
      total += (cartItem.price * (cartItem.quantity).toDouble());
    });
    return total;
  }

  void addItem(String id, double price, String title, String ShortDesc,
      String imgUrl, int qunatity) {
    if (_items.containsKey(id)) {
      print('found $id');
      _items.update(
          id,
          (exitingCartItem) => Plant(
                id: exitingCartItem.id,
                title: exitingCartItem.title,
                price: exitingCartItem.price,
                imgUrl: exitingCartItem.imgUrl,
                shortInfo: exitingCartItem.shortInfo,
                quantity: exitingCartItem.quantity + 1,
              ));
    } else {
      print('not found $id');
      _items.putIfAbsent(
          id,
          () => Plant(
              id: id,
              title: title,
              price: price,
              shortInfo: ShortDesc,
              imgUrl: imgUrl,
              quantity: qunatity));
    }
    notifyListeners();
  }

  void remove(String? id) {
    _items.remove(id);
    totalAmount;
    notifyListeners();
  }

  void removeItem(String id, double price, String title, String ShortDesc,
      String imgUrl, int qunatity) {
    if (_items.containsKey(id)) {
      print('found $id');
      _items.update(
          id,
          (exitingCartItem) => Plant(
                id: exitingCartItem.id,
                title: exitingCartItem.title,
                price: exitingCartItem.price,
                imgUrl: exitingCartItem.imgUrl,
                shortInfo: exitingCartItem.shortInfo,
                quantity: exitingCartItem.quantity - 1,
              ));
    } else {
      print('not found $id');
      _items.putIfAbsent(
          id,
          () => Plant(
              id: id,
              title: title,
              price: price,
              shortInfo: ShortDesc,
              imgUrl: imgUrl,
              quantity: qunatity));
    }
    notifyListeners();
  }

  String findByIdShow(String? id) {
    final total = _items[id]?.quantity;
    return total.toString();
  }
}
