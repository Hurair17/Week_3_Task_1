import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:week_3_task/core/models/cart_model.dart';
import 'package:week_3_task/core/models/plant.dart';

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String getUserId() {
    final User? user = auth.currentUser;
    final uuid = user!.uid;
    return uuid;
    // here you write the codes to input the data into firestore
  }

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
  Future<void> addPlantToCart({cartModel}) async {
    String uuid = getUserId();
    debugPrint('Uid Print in Pakistan $uuid');
    ///////////////////////////////////////////
    bool check = true;
    await _firestore
        .collection('test_cart')
        .doc(uuid)
        .collection('UserCart')
        .doc(cartModel.cartId)
        .get()
        .then((value) {
      if (value.exists) {
        _firestore
            .collection('test_cart')
            .doc(uuid)
            .collection('UserCart')
            .doc(cartModel.cartId)
            .update({'quantity': FieldValue.increment(cartModel.quantity)});
      } else {
        try {
          _firestore
              .collection('test_cart')
              .doc(uuid)
              .collection('UserCart')
              .doc(cartModel.cartId)
              .set(cartModel.toJson());
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    });

    //////////////////////////////////////////
    if (check) {}
  }

  //Delete Data from Cart
  Future<void> deleteCartPlant(String cartId) async {
    String uuid = getUserId();
    try {
      final query = _firestore.collection('test_cart').doc(uuid);

      query.collection('UserCart').doc(cartId).delete();
      debugPrint('pakistan delete data 1');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //Get Cart Plants of the  User
  Future<List<CartModel>> getCartPlants() async {
    List<CartModel> listCartPlant = [];
    String uuid = getUserId();
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('test_cart')
          .doc(uuid)
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

  //Increment Quantity of the Plant in Cart
  Future<void> incrementquantity(cartId) async {
    String uuid = getUserId();
    await _firestore
        .collection('test_cart')
        .doc(uuid)
        .collection('UserCart')
        .doc(cartId)
        .update({'quantity': FieldValue.increment(1)});
  }

  //Decrement Quantity of the Plant in Cart
  Future<void> decrementquantity(cartId) async {
    String uuid = getUserId();
    await _firestore
        .collection('test_cart')
        .doc(uuid)
        .collection('UserCart')
        .doc(cartId)
        .update({'quantity': FieldValue.increment(-1)});
  }
}
