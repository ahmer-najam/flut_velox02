import 'package:flut_velox02/data/my_store.dart';
import 'package:flut_velox02/models/car_make.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CarMakeFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _carMakeIdController = TextEditingController();
    final _carMakeNameController = TextEditingController();
    MyStore store = VxState.store as MyStore;

    return Scaffold(
        appBar: AppBar(
          title: Text("VelocityX App2"),
        ),
        body: VxBuilder(
          mutations: {SaveCarMake},
          builder: (context, _) => Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _carMakeIdController,
                    decoration: InputDecoration(labelText: "ID"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Make ID';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _carMakeNameController,
                    decoration: InputDecoration(labelText: "Make"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Make';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final _carMake = new CarMake(
                            int.parse(_carMakeIdController.text),
                            _carMakeNameController.text);
                        SaveCarMake(_carMake);

                        print(_carMake.carMakeName);
                      },
                      // ignore: prefer_const_constructors
                      child: Text("Save")),
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(child: CarMakeList()),
                ],
              )),
        ));
  }
}

class CarMakeList extends StatelessWidget {
  MyStore store = VxState.store as MyStore;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: store.carMakes.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(store.carMakes[index].carMakeName),
            subtitle: Text(store.carMakes[index].carMakeId.toString()),
          );
        });
  }
}
