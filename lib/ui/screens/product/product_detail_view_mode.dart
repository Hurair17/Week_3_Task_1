import 'package:flutter/material.dart';

class ProductDetailViewModel extends ChangeNotifier {
  int _items = 1;
  int _btnItems = 1;
  final double _itemPrice = 20.30;

  double get itemPrice => _itemPrice;
  int get btnCount => _btnItems;
  int get count => _items;

  void increment() {
    _items++;
    notifyListeners();
  }

  void decrement() {
    if (_items > 1) {
      _items--;
      notifyListeners();
    } else {
      _items = 1;
      notifyListeners();
    }
  }

  void btnincrement() {
    _btnItems++;

    notifyListeners();
  }

  void btndecrement() {
    if (_btnItems > 0) {
      _btnItems--;
    } else {
      _btnItems = 0;
    }

    if (_btnItems == 0) {
      _items = 1;
    }

    notifyListeners();
  }
}
