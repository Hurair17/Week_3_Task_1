import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/cart_model.dart';
import 'package:week_3_task/core/models/plant.dart';
import 'package:week_3_task/core/models/test_model.dart';
import 'package:week_3_task/ui/screens/cart/cart2.dart';
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

  // Get all Data of Plants from the Database
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
        debugPrint(
            'Database data length => ${listPlant.length} ${listPlant[1]}');
        return listPlant;
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  //Add Data to Cart
  Future<void> addPlantToCart(
      {cartId, price, quantity, shortInfo, title, imgUrl}) async {
    final cartPlants = <String, dynamic>{
      'cartId': cartId,
      'price': price,
      'quantity': quantity,
      'shortInfo': shortInfo,
      'title': title,
      'imgUrl': imgUrl,
    };
    try {
      final addCollection =
          _firestore.collection('test_cart').doc('put-user-id-3');

      addCollection.collection('UserCart').doc(cartId).set(cartPlants);
      debugPrint('pakistan put data 1');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Delete Data from Cart
  Future<void> deleteCartPlant(String cartId) async {
    try {
      final addCollection =
          _firestore.collection('test_cart').doc('put-user-id-3');

      addCollection.collection('UserCart').doc(cartId).delete();
      debugPrint('pakistan delete data 1');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<int> cartItems() async {
  //   try {
  //     List list = [];
  //     QuerySnapshot snapshot = await _firestore
  //         .collection('test_cart')
  //         .doc('put-user-id-2')
  //         .collection('UserCart')
  //         .get();
  //     if (snapshot.docs.isEmpty) {
  //       debugPrint('No data');
  //       return 0;
  //     } else {
  //       debugPrint('pakistan get Cart 4');
  //       snapshot.docs.forEach((element) {
  //         list.add(CartModel.fromJson(element.data(), element.id));
  //       });
  //       debugPrint('Cart data length => ${list.length} ');
  //       // countCartItem = listCartPlant.length;
  //       return list.length;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return 0;
  //   }
  // }

  Future<List<CartModel>> getCartPlants() async {
    List<CartModel> listCartPlant = [];
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('test_cart')
          .doc('put-user-id-3')
          .collection('UserCart')
          .get();
      if (snapshot.docs.isEmpty) {
        debugPrint('No data');
        return [];
      } else {
        debugPrint('pakistan get Cart 4');
        snapshot.docs.forEach((element) {
          listCartPlant.add(CartModel.fromJson(element.data(), element.id));
        });
        debugPrint('get Cart data length => ${listCartPlant.length} ');
        // countCartItem = listCartPlant.length;
      }
      return listCartPlant;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> incrementquantity(cartId) async {
    _firestore
        .collection('test_cart')
        .doc('put-user-id-3')
        .collection('UserCart')
        .where("cartId", isEqualTo: cartId)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('test_cart')
            .doc('put-user-id-3')
            .collection('UserCart')
            .doc(element.id)
            .update({'quantity': FieldValue.increment(1)});
      });
    });
  }

  Future<void> decrementquantity(cartId) async {
    _firestore
        .collection('test_cart')
        .doc('put-user-id-3')
        .collection('UserCart')
        .where("cartId", isEqualTo: cartId)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection('test_cart')
            .doc('put-user-id-3')
            .collection('UserCart')
            .doc(element.id)
            .update({'quantity': FieldValue.increment(-1)});
      });
    });
  }
}
