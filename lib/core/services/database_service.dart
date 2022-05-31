import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/models/test_model.dart';
import 'package:week_3_task/ui/screens/home/home_view_model.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  // getPlants() {
  // List<Plant> plants = [
  //   Plant(
  //     id: 'p1',
  //     title: 'Peace Lily',
  //     type: 'Indoor',
  //     description:
  //         'This is the main description of the Plant use in Detail Screen',
  //     imgUrl: 'assets/plant/plant1.png',
  //     shortInfo: 'This is short info for cart Screen',
  //     price: 21.89,
  //     // quantity: 1,
  //   ),
  //   Plant(
  //     id: 'p2',
  //     title: 'Schefflera',
  //     type: 'Outdoor',
  //     description:
  //         'This is the main description of the Plant use in Detail Screen',
  //     imgUrl: 'assets/plant/plant2.png',
  //     shortInfo: 'This is short info for cart Screen',
  //     price: 30.93,
  //     // quantity: 1,
  //   ),
  //   Plant(
  //     id: 'p3',
  //     title: 'Waterlily',
  //     type: 'Outdoor',
  //     description:
  //         'This is the main description of the Plant use in Detail Screen',
  //     imgUrl: 'assets/plant/plant3.png',
  //     shortInfo: 'This is short info for cart Screen',
  //     price: 40.93,
  //     // quantity: 1,
  //   ),
  //   Plant(
  //     id: 'p4',
  //     title: 'Peach ',
  //     type: 'outdoor',
  //     description:
  //         'This is the main description of the Plant use in Detail Screen',
  //     imgUrl: 'assets/plant/plant4.png',
  //     shortInfo: 'This is short info for cart Screen',
  //     price: 21,
  //     // quantity: 1,
  //   ),
  //   Plant(
  //     id: 'p5',
  //     title: 'Walnut',
  //     type: 'outdoor',
  //     description:
  //         'This is the main description of the Plant use in Detail Screen',
  //     imgUrl: 'assets/plant/plant5.png',
  //     shortInfo: 'This is short info for cart Screen',
  //     price: 100,
  //     // quantity: 1,
  //   ),
  //   Plant(
  //     id: 'p6',
  //     title: 'WaterIn',
  //     type: 'InWater',
  //     description:
  //         'This is the main description of the Plant use in Detail Screen',
  //     imgUrl: 'assets/plant/plant6.png',
  //     shortInfo: 'This is short info for cart Screen',
  //     price: 21.89,
  //     // quantity: 1,
  //   ),
  // ];

  Future<List<Plant>> getPlants() async {
    List<Plant> listPlant = [];
    try {
      QuerySnapshot snapshot = await _firestore.collection('plants').get();
      if (snapshot.docs.isEmpty) {
        debugPrint('No data');
        return [];
      } else {
        debugPrint('pakistan get data 1');
        snapshot.docs.forEach((element) {
          listPlant.add(Plant.fromJson(element.data(), element.id));
        });
        debugPrint('Database data length => ${listPlant.length}');
        return listPlant;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

//   Future<List<TestModel>> getTestDataDb() async {
//     List<TestModel> listTest = [];
//     try {
//       QuerySnapshot snapshot =
//           await _firestore.collection('testing_data').get();
//       if (snapshot.docs.isEmpty) {
//         debugPrint("No data found in testing_data");
//       } else {
//         snapshot.docs.forEach((element) {
//           listTest.add(TestModel.fromJson(element.data(), element.id));
//         });
//         debugPrint('testing_data length => ${listTest.length}');
//       }
//       return listTest;
//     } catch (e) {
//       debugPrint('Error getting test data ${e.toString()}');
//       return [];
//     }
//   }

// // Fetching on documnet id
//   Future<TestModel> getOneObject() async {
//     TestModel testModel = TestModel();
//     try {
//       DocumentSnapshot documentSnapshot = await _firestore
//           .collection('testing_data')
//           .doc('IryokLgPPSsQbX1AnzT6')
//           .get();
//       testModel =
//           TestModel.fromJson(documentSnapshot.data(), documentSnapshot.id);
//       return testModel;
//     } catch (e) {
//       debugPrint('Error getting test data ${e.toString()}');
//       return testModel;
//     }
//   }
}
