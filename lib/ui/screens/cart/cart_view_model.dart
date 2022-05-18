import 'package:flutter/material.dart';

class CartItemsViewModel extends ChangeNotifier {
  int _items = 1;
  final double _itemPrice = 20.30;
  int get items => _items;
  double get itemPrice => _itemPrice;
  final double _total = 0.0;
  double get total => _total;

  void increment() {
    _items++;
    notifyListeners();
  }

  void decrement() {
    if (_items > 0) {
      _items--;
      notifyListeners();
    } else {
      _items = 0;

      notifyListeners();
    }
  }
}
