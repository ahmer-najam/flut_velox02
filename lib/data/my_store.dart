import 'package:flut_velox02/models/car_make.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  List<CarMake> carMakes = [
    CarMake(1001, 'Toyota'),
    CarMake(1002, 'Honda'),
  ];
  CarMake carMake = CarMake(-1, '');
}

class SaveCarMake extends VxMutation<MyStore> {
  final CarMake _carMake;

  SaveCarMake(this._carMake);
  @override
  perform() {
    store!.carMakes.add(this._carMake);
  }
}
