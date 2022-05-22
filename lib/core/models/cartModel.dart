// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:week_3_task/core/models/plant.dart';

class Cart {
  String? id;
  String? title;
  String? imgUrl;
  String? shortDesc;

  int? quantity;
  double? price;
  Cart({
    this.id,
    this.title,
    this.imgUrl,
    this.shortDesc,
    this.quantity,
    this.price,
  });

  Cart copyWith({
    String? id,
    String? title,
    String? imgUrl,
    String? shortDesc,
    int? quantity,
    double? price,
  }) {
    return Cart(
      id: id ?? this.id,
      title: title ?? this.title,
      imgUrl: imgUrl ?? this.imgUrl,
      shortDesc: shortDesc ?? this.shortDesc,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imgUrl': imgUrl,
      'shortDesc': shortDesc,
      'quantity': quantity,
      'price': price,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'] as String,
      title: map['title'] as String,
      imgUrl: map['imgUrl'] as String,
      shortDesc: map['shortDesc'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cart(id: $id, title: $title, imgUrl: $imgUrl, shortDesc: $shortDesc, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.id == id &&
        other.title == title &&
        other.imgUrl == imgUrl &&
        other.shortDesc == shortDesc &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        imgUrl.hashCode ^
        shortDesc.hashCode ^
        quantity.hashCode ^
        price.hashCode;
  }
}
