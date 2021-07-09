import 'package:flut_velox02/data/my_store.dart';
import 'package:flut_velox02/screens/car_make_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(
    store: MyStore(),
    // interceptors: [LogInterceptor()],
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CarMakeFormScreen(),
    );
  }
}
