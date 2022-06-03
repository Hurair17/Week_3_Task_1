// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:week_3_task/core/models/plant.dart';

class CartModel {
  String? cartId;
  String? imgUrl;
  String? shortInfo;
  String? title;
  double? price;
  int? quantity;
  CartModel({
    this.cartId,
    this.imgUrl,
    this.shortInfo,
    this.title,
    this.price,
    this.quantity,
  });
  toJson() {
    return {
      'cartId': cartId,
      'imgUrl': imgUrl,
      'shortInfo': shortInfo,
      'title': title,
      'price': price,
      'quantity': quantity,
    };
  }

  CartModel.fromJson(json, id) {
    this.cartId = id;
    imgUrl = json['imgUrl'] ??
        "https://static.vecteezy.com/system/resources/previews/001/196/554/original/person-png.png";
    shortInfo = json['shortInfo'] ?? "This is short info for cart Screen";
    title = json['title'] ?? "Plant";
    price = json['price'] ?? 0.00;
    quantity = json['quantity'] ?? 1;
  }
}
