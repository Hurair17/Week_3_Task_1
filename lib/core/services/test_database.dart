import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/test_model.dart';

class TestDatabase {
  final _firestore = FirebaseFirestore.instance;

  Future<List<TestModel>> getTestDataDb() async {
    List<TestModel> listTest = [];
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('testing_data').get();
      if (snapshot.docs.isEmpty) {
        debugPrint("No data found in testing_data");
      } else {
        snapshot.docs.forEach((element) {
          listTest.add(TestModel.fromJson(element.data(), element.id));
        });
        debugPrint('testing_data length => ${listTest.length}');
      }
      return listTest;
    } catch (e) {
      debugPrint('Error getting test data ${e.toString()}');
      return [];
    }
  }

// For fecthing one document
  Future<TestModel> getOneObject() async {
    TestModel testModel = TestModel();
    try {
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('testing_data')
          .doc('IryokLgPPSsQbX1AnzT6')
          .get();
      testModel =
          TestModel.fromJson(documentSnapshot.data(), documentSnapshot.id);
      return testModel;
    } catch (e) {
      debugPrint('Error getting test data ${e.toString()}');
      return testModel;
    }
  }
}
