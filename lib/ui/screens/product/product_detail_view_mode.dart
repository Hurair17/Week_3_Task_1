import 'package:flutter/material.dart';

class ProductDetailViewModel extends ChangeNotifier {
  int _items = 1;
  int _btnItems = 0;

  int get btnCount => _btnItems;
  int get count => _items;

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

  void btnincrement() {
    _btnItems++;
    notifyListeners();
  }

  void btndecrement() {
    _btnItems--;
    notifyListeners();
  }
}
