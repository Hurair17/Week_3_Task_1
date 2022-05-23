import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/services/database_service.dart';
import '../cart/cart_view_model.dart';

class HomeViewModel extends ChangeNotifier {
  // final _dbServices = DatabaseService();
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
    // notifyListeners();
  }
}
