import 'package:flutter/cupertino.dart';
import '../../../core/models/cart_model.dart';
import '../../../core/services/database_service.dart';

class ProductViewModel extends ChangeNotifier {
  final _dbService = DatabaseService();
  CartModel cartModel = CartModel();
  bool isLoading = false;

  putPlantsData({cartId, imgUrl, price, quantity, title, shortInfo}) async {
    isLoading = true;
    cartModel.cartId = cartId;
    cartModel.imgUrl = imgUrl;
    cartModel.price = price;
    cartModel.quantity = quantity;
    cartModel.title = title;
    cartModel.shortInfo = shortInfo;
    notifyListeners();
    _dbService.addPlantToCart(cartModel: cartModel);
    debugPrint('testData Add View Model => }');
    isLoading = false;
    notifyListeners();
  }
}
