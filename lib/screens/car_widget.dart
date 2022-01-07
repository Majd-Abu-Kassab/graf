import 'package:flutter/material.dart';
import 'package:lottie_animation/screens/carData.dart';



Widget buildCar(Car car, int index){
  return SafeArea(
    child: Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Expanded(
              child: Center(
                child: Hero(
                  tag: car.model,
                  child: Image.asset(
                    car.images[0],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 24,
            ),

            Text(
              car.model,
              style: TextStyle(
                  fontSize: 18
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Text(
              car.brand,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              car.price.toString()+" JD",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}