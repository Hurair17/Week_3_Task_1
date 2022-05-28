import 'package:week_3_task/core/models/plant.dart';

class DatabaseService {
  // getPlants() {
  List<Plant> plants = [
    // Plant(),
    // Plant()
    Plant(
      id: 'p1',
      title: 'Peace Lily',
      type: 'Indoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant1.png',
      shortInfo: 'This is short info for cart Screen',
      price: 21.89,
      // quantity: 1,
    ),
    Plant(
      id: 'p2',
      title: 'Schefflera',
      type: 'Outdoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant2.png',
      shortInfo: 'This is short info for cart Screen',
      price: 30.93,
      // quantity: 1,
    ),
    Plant(
      id: 'p3',
      title: 'Waterlily',
      type: 'Outdoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant3.png',
      shortInfo: 'This is short info for cart Screen',
      price: 40.93,
      // quantity: 1,
    ),
    Plant(
      id: 'p4',
      title: 'Peach ',
      type: 'outdoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant4.png',
      shortInfo: 'This is short info for cart Screen',
      price: 21,
      // quantity: 1,
    ),
    Plant(
      id: 'p5',
      title: 'Walnut',
      type: 'outdoor',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant5.png',
      shortInfo: 'This is short info for cart Screen',
      price: 100,
      // quantity: 1,
    ),
    Plant(
      id: 'p6',
      title: 'WaterIn',
      type: 'InWater',
      description:
          'This is the main description of the Plant use in Detail Screen',
      imgUrl: 'assets/plant/plant6.png',
      shortInfo: 'This is short info for cart Screen',
      price: 21.89,
      // quantity: 1,
    ),
  ];
  // }
}
