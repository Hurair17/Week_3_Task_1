import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/services/database_service.dart';
import '../cart/cart_view_model.dart';

class HomeViewModel extends ChangeNotifier {
  final List<Plant> _plants = DatabaseService().plants;

  List<Plant> get plants {
    return [..._plants];
  }

  Plant findById(String? id) {
    return _plants.firstWhere((element) => element.id == id);
  }

  void findByIdIncrement(String? id) {
    final total = _plants.firstWhere((element) => element.id == id);
    total.quantity++;
    notifyListeners();
  }

  void findByIdIdecrement(String? id) {
    final total = _plants.firstWhere((element) => element.id == id);
    if (total.quantity > 1) {
      total.quantity--;
    }

    notifyListeners();
  }

  String findByIdShow(String? id) {
    final total = _plants.firstWhere((element) => element.id == id);
    return total.quantity.toString();
  }

  // Add items To the Recent Views
  final Map<String, Plant> _recentView = {};
  Map<String, Plant> get recentView {
    // ignore: recursive_getters
    return _recentView;
  }

  int get itemCount {
    return _recentView.length;
  }

  void addItem(String id, double price, String title, String ShortDesc,
      String imgUrl, int qunatity) {
    if (_recentView.containsKey(id)) {
      print('found $id');
      _recentView.update(
          id,
          (exitingCartItem) => Plant(
                id: exitingCartItem.id,
                title: exitingCartItem.title,
                price: exitingCartItem.price,
                imgUrl: exitingCartItem.imgUrl,
                shortInfo: exitingCartItem.shortInfo,
                quantity: exitingCartItem.quantity,
              ));
    } else {
      print('not found $id');
      _recentView.putIfAbsent(
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

  List<Tab> tabsList = const [
    Tab(
      text: 'Recommended',
    ),
    Tab(
      text: 'Top',
    ),
    Tab(
      text: 'Indoore',
    ),
    Tab(
      text: 'Outdoor',
    ),
  ];
}
