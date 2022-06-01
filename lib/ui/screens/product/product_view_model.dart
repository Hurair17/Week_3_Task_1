import 'package:flutter/cupertino.dart';
import '../../../core/models/cart_model.dart';
import '../../../core/services/database_service.dart';

class ProductViewModel extends ChangeNotifier {
  final _dbService = DatabaseService();
  CartModel cartModel = CartModel();
  bool isLoading = false;

  putPlantsData({cartId, imgUrl, price, quantity, title, shortInfo}) async {
    isLoading = true;
    notifyListeners();
    _dbService.putPlants(
        cartId: cartId,
        imgUrl: imgUrl,
        price: price,
        quantity: quantity,
        title: title,
        shortInfo: shortInfo);
    debugPrint('testData Add View Model => }');
    isLoading = false;
    notifyListeners();
  }
}
