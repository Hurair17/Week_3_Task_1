import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/services/database_service.dart';

class HomeViewModel extends ChangeNotifier {
  final _dbService = DatabaseService();
  List<Plant> plants = [];
  bool isLoading = false;

  HomeViewModel() {
    getPlantsData();
  }

  getPlantsData() async {
    isLoading = true;
    notifyListeners();
    plants = await _dbService.getPlants();
    debugPrint('testData Length View Model => ${plants.length}');
    isLoading = false;
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
