import 'package:flutter/material.dart';
import 'package:week_3_task/core/models/amount_model.dart';
import 'package:week_3_task/core/models/cart_model.dart';
import '../../../core/services/database_service.dart';

class CartViewModel extends ChangeNotifier {
  final dbService = DatabaseService();
  int count = TotalAmountModel().count;

  List<CartModel> cartPlants = [];
  bool isLoading = false;

  getCartPlantsData() async {
    double cost = 0;
    isLoading = true;
    notifyListeners();
    cartPlants = await dbService.getCartPlants();
    debugPrint('testData Length View Model => ${cartPlants.length}');
    isLoading = false;
    count = cartPlants.length;
    notifyListeners();
    if (cartPlants.length > 0) {
      notifyListeners();

      // lable = true;
      notifyListeners();

      // count = cartPlants.length;
    } else {
      notifyListeners();
      // lable = false;
    }
  }

  bool get lable => cartPlants.length == 0 ? false : true;
  // Get Total Amount
  double get total {
    double cost = 0.0;
    for (int i = 0; i < cartPlants.length; i++) {
      cost += cartPlants[i].price! * (cartPlants[i].quantity)!.toDouble();
    }
    return cost;
  }

  delete2CartPlant(String cartId, int index) async {
    await dbService.deleteCartPlant(cartId);
    notifyListeners();
    cartPlants.removeAt(index);
    notifyListeners();
  }

  deleteCartPlant(String cartId) async {
    await dbService.deleteCartPlant(cartId);
    notifyListeners();
    getCartPlantsData();
    notifyListeners();
  }

  incrementQuantity(cartId) async {
    notifyListeners();
    await dbService.incrementquantity(cartId);
    notifyListeners();
    await getCartPlantsData();
  }

  decrementQuantity(cartId) async {
    notifyListeners();
    await dbService.decrementquantity(cartId);
    notifyListeners();
    await getCartPlantsData();
  }

  // TotalAmountModel totalAmountModel = TotalAmountModel();
  // double totalCost = 0;
  // void totalAmount() {
  //   double cost = 0;
  //   notifyListeners();
  //   for (int i = 0; i < cartPlants.length; i++) {
  //     cost += cartPlants[i].price! * (cartPlants[i].quantity)!.toDouble();
  //   }
  //   total = cost;
  //   notifyListeners();
  // }

  // bool _label = false;
  // void getlable() {
  //   if (cartPlants.length > 0) {
  //     lable = true;
  //     notifyListeners();
  //   } else {
  //     notifyListeners();
  //     lable = false;
  //   }
  // }

  static void getCartPlants() {}

  // final _amount = TotalAmount();
  // double get totalAmount {
  //   double total = _amount.subTotal;
  //   _items.forEach((key, cartItem) {
  //     // print(key);
  //     total += (cartItem.price! * (cartItem.quantity)!.toDouble());
  //   });
  //   return total;
  // }

  // void addItem(String id, double price, String title, String ShortDesc,
  //     String imgUrl, int qunatity) {
  //   if (_items.containsKey(id)) {
  //     print('found $id');
  //     _items.update(
  //         id,
  //         (exitingCartItem) => Plant(
  //               id: exitingCartItem.id,
  //               title: exitingCartItem.title,
  //               price: exitingCartItem.price,
  //               imgUrl: exitingCartItem.imgUrl,
  //               shortInfo: exitingCartItem.shortInfo,
  //               quantity: exitingCartItem.quantity,
  //             ));
  //   } else {
  //     print('not found $id');
  //     _items.putIfAbsent(
  //         id,
  //         () => Plant(
  //             id: id,
  //             title: title,
  //             price: price,
  //             shortInfo: ShortDesc,
  //             imgUrl: imgUrl,
  //             quantity: qunatity));
  //   }
  //   notifyListeners();
  // }

  // void remove(String? id) {
  //   _items.remove(id);
  //   totalAmount;
  //   notifyListeners();
  // }

  // void removeItem(String id, double price, String title, String ShortDesc,
  //     String imgUrl, int qunatity) {
  //   if (_items.containsKey(id)) {
  //     print('found $id');
  //     _items.update(
  //         id,
  //         (exitingCartItem) => Plant(
  //               id: exitingCartItem.id,
  //               title: exitingCartItem.title,
  //               price: exitingCartItem.price,
  //               imgUrl: exitingCartItem.imgUrl,
  //               shortInfo: exitingCartItem.shortInfo,
  //               quantity: exitingCartItem.quantity,
  //             ));
  //   } else {
  //     print('not found $id');
  //     _items.putIfAbsent(
  //         id,
  //         () => Plant(
  //             id: id,
  //             title: title,
  //             price: price,
  //             shortInfo: ShortDesc,
  //             imgUrl: imgUrl,
  //             quantity: qunatity));
  //   }
  //   notifyListeners();
  // }

  // String findByIdShow(String? id) {
  //   final total = _items[id]?.quantity;
  //   return total.toString();
  // }
}
