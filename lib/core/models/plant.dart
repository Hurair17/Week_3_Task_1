// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

class Plant {
  String? id;
  String? title;
  String? type;
  String? description;
  String? imgUrl;
  String? shortInfo;
  double? price;
  int? quantity;
  Plant({
    this.id,
    this.title,
    this.type,
    this.description,
    this.imgUrl,
    this.shortInfo,
    this.price,
    this.quantity,
  });

  toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'description': description,
      'imgUrl': imgUrl,
      'shortInfo': shortInfo,
      'price': price,
      'quantity': quantity,
    };
  }

  Plant.fromJson(json, id) {
    this.id = id;
    title = json['title'] ?? "Plant";
    type = json['type'] ?? 'Envirment';
    description = json['description'] ??
        'This is the main description of the Plant use in Detail Screen';
    imgUrl = json['imgUrl'] ??
        'https://static.vecteezy.com/system/resources/previews/001/196/554/original/person-png.png';
    shortInfo = json['shortInfo'] ?? 'This is short info for cart Screen';
    price = json['price'] ?? 0.00;
    quantity = json['quantity'] ?? 1;
  }
}
