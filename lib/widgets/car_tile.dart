import 'package:flutter/material.dart';
import 'package:lesson2/models/car.dart';

class CarTile extends StatelessWidget {
  Car car;
  CarTile({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(car.brand),
      subtitle: Text(car.price.toString()),
    );
  }
}
