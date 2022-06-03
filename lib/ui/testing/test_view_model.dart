import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/test_model.dart';
import '../../core/services/test_database.dart';

class TestViewModel extends ChangeNotifier {
  final _dbService = TestDatabase();
  List<TestModel> testModel = [];
  bool isLoading = false;

  TestViewModel() {
    getTestData();
  }

  getTestData() async {
    isLoading = true;
    notifyListeners();
    testModel = await _dbService.getTestDataDb();
    debugPrint('testData Length View Model => ${testModel.length}');
    isLoading = false;
    notifyListeners();
  }
}
