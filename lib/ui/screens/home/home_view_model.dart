import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/services/database_service.dart';

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
    total.qunatity++;
    notifyListeners();
  }

  void findByIdIdecrement(String? id) {
    final total = _plants.firstWhere((element) => element.id == id);
    total.qunatity--;
    notifyListeners();
  }

  String findByIdShow(String? id) {
    final total = _plants.firstWhere((element) => element.id == id);
    return total.qunatity.toString();
    // notifyListeners();
  }
}
