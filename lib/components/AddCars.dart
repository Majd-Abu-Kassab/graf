// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/components/rounded_button.dart';
import 'package:lottie_animation/models/Car.dart';

class AddCars extends StatefulWidget {
  @override
  _AddCarsState createState() => _AddCarsState();
}
//

class _AddCarsState extends State<AddCars> {
  Car car= Car();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          addDialog(context);
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
  Future<bool> addDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Add Car',
              style: TextStyle(fontSize: 15),
            ),
            content: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Color'),
                  onChanged: (value) {
                    car.Color = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Image'),
                  onChanged: (value) {
                    car.Image = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Model'),
                  onChanged: (value) {
                    car.Model = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Name'),
                  onChanged: (value) {
                    car.Name = value;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Enter car Price'),
                  onChanged: (value) {
                   car.Price = value;
                  },
                ),
              ],
            ),
            actions: <Widget>[
              RoundedButton(
                title: 'Add',
                colour: Colors.blue,
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('Cars')
                      .add({'Color':car.Color ,
                    'Image': car.Image,
                    'Model':car.Model,
                    'Name':car.Name,
                    'Price':car.Price,
                  });
                  if(car!=null){
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                        SnackBar(
                          content: Text(
                              'Car added successfully'),
                        )
                    );
                  }
                  Navigator.of(context).pop();
                  }, //onpressed
              )
            ],
          );
        });
  }
}

