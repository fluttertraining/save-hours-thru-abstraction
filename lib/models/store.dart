import 'package:abstraction_demo/models/food.dart';

class Store {
  final int id;
  final String name;
  final List<Food> foods;
  final double deliveryFee;

  Store({this.id, this.name, this.foods, this.deliveryFee});
}
