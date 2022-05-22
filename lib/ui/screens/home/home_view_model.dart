import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/services/database_service.dart';

class HomeViewModel extends ChangeNotifier {
  final _dbServices = DatabaseService();
  final List<Plant> _plants = [
    Plant(
      id: 'p1',
      title: 'Peace Lily',
      type: 'Indoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant1.png',
      shortInfo: 'This is short info for cart Screen',
      price: 21.89,
    ),
    Plant(
      id: 'p2',
      title: 'Schefflera',
      type: 'Outdoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant2.png',
      shortInfo: 'This is short info for cart Screen',
      price: 30.93,
    )
  ];

  List<Plant> get plants {
    return [..._plants];
  }

  Plant findById(String? id) {
    return _plants.firstWhere((element) => element.id == id);
  }

  // List<Plant> get plants => [..._dbServices];

  // get getPlant {
  //   plants = _dbServices.getPlants();
  //   return plants;
  //   notifyListeners();
  // }

}
