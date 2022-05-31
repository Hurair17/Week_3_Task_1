import 'package:flutter/cupertino.dart';

import '../../../core/models/plant.dart';
import '../../../core/services/database_service.dart';

class ProductViewModel extends ChangeNotifier {
  final _dbService = DatabaseService();
  bool isLoading = false;
  // ProductViewModel() {
  //   putPlantsData();
  // }

  putPlantsData(plant) async {
    isLoading = true;
    notifyListeners();
    _dbService.putPlants(plant);
    debugPrint('testData Add View Model => }');
    isLoading = false;
    notifyListeners();
  }
}
