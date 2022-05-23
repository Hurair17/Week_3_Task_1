// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'dart:ui';

class Plant {
  String id;
  String title;
  String type;
  String description;
  String imgUrl;
  String shortInfo;
  double price;
  int qunatity;
  Plant({
    this.id = 'p0',
    this.title = 'Waterlily',
    this.type = 'Outdoor',
    this.description = 'It Grow in Water Obsorb Alot of Water',
    this.imgUrl = 'assets/plant/plant1.png',
    this.shortInfo = 'Long Leaves in water',
    required this.qunatity,
    this.price = 30.32,
  });
}
