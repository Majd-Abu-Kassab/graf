import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie_animation/screens/carData.dart';

import 'car_widget.dart';

class CarInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    childAspectRatio: 1 / 1.55,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: getCarList().map((item) {
                      return GestureDetector(
                          child: buildCar(item, null)
                      );
                    }).toList(),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}


