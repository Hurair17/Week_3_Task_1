import 'package:week_3_task/core/models/plant.dart';

class DatabaseService {
  getPlants() {
    List<Plant> plants = [
      // Plant(),
      // Plant()
      Plant(
        id: 'p1',
        title: 'Peace Lily',
        type: 'Indoor',
        description:
            'This is the main description of the Plant use in Detail Screen',
        imgUrl: 'assets/plant/plant (1).png',
        shortInfo: 'This is short info for cart Screen',
        price: 21.89,
      ),
      Plant(
        id: 'p1',
        title: 'Schefflera',
        type: 'Outdoor',
        description:
            'This is the main description of the Plant use in Detail Screen',
        imgUrl: 'assets/plant/plant (2).png',
        shortInfo: 'This is short info for cart Screen',
        price: 21.89,
      )
    ];
  }
}
