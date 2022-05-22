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
  Plant({
    this.id = 'p0',
    this.title = 'Waterlily',
    this.type = 'Outdoor',
    this.description = 'It Grow in Water Obsorb Alot of Water',
    this.imgUrl = 'assets/plant/plant (3).png',
    this.shortInfo = 'Long Leaves in water',
    this.price = 30.32,
  });
  // Product(
  //     id: 'p1',
  //     title: 'Red Shirt',
  //     description: 'A red shirt - it is pretty red!',
  //     price: 29.99,
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  //   ),

  Plant copyWith({
    String? id,
    String? title,
    String? type,
    String? description,
    String? imgUrl,
    String? shortInfo,
    double? price,
  }) {
    return Plant(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      shortInfo: shortInfo ?? this.shortInfo,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'type': type,
      'description': description,
      'imgUrl': imgUrl,
      'shortInfo': shortInfo,
      'price': price,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    return Plant(
        // id: map['id'] != null ? map['id'] as String : null,
        //   title: map['title'] != null ? map['title'] as String : null,
        //   type: map['type'] != null ? map['type'] as String : null,
        //   description:
        //       map['description'] != null ? map['description'] as String : null,
        //   imgUrl: map['imgUrl'] != null ? map['imgUrl'] as String : null,
        //   shortInfo: map['shortInfo'] != null ? map['shortInfo'] as String : null,
        //   price: map['price'] != null ? map['price'] as double : null,
        );
  }

  String toJson() => json.encode(toMap());

  factory Plant.fromJson(String source) =>
      Plant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Plant(id: $id, title: $title, type: $type, description: $description, imgUrl: $imgUrl, shortInfo: $shortInfo, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Plant &&
        other.id == id &&
        other.title == title &&
        other.type == type &&
        other.description == description &&
        other.imgUrl == imgUrl &&
        other.shortInfo == shortInfo &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        type.hashCode ^
        description.hashCode ^
        imgUrl.hashCode ^
        shortInfo.hashCode ^
        price.hashCode;
  }
}


// class Plant {
//   String? imgUrl;
//   String? description;
//   String? type;
//   String? name;
//   double? price;

//   Plant({
//     this.imgUrl = 'assets/images/plant (3).png',
//     this.description = 'This is description',
//     this.type = 'indoor',
//     this.name = 'Angoor',
//     this.price = 5.5,
//   });

//   Plant copyWith({
//     String? imgUrl,
//     String? description,
//     String? type,
//     String? name,
//     double? price,
//   }) {
//     return Plant(
//       imgUrl: imgUrl ?? this.imgUrl,
//       description: description ?? this.description,
//       type: type ?? this.type,
//       name: name ?? this.name,
//       price: price ?? this.price,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'imgUrl': imgUrl,
//       'description': description,
//       'type': type,
//       'name': name,
//       'price': price,
//     };
//   }

//   factory Plant.fromMap(Map<String, dynamic> map) {
//     return Plant(
//       imgUrl: map['imgUrl'],
//       description: map['description'],
//       type: map['type'],
//       name: map['name'],
//       price: map['price']?.toDouble(),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Plant.fromJson(String source) => Plant.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Plant(imgUrl: $imgUrl, description: $description, type: $type, name: $name, price: $price)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Plant &&
//         other.imgUrl == imgUrl &&
//         other.description == description &&
//         other.type == type &&
//         other.name == name &&
//         other.price == price;
//   }

//   @override
//   int get hashCode {
//     return imgUrl.hashCode ^
//         description.hashCode ^
//         type.hashCode ^
//         name.hashCode ^
//         price.hashCode;
//   }
// }
