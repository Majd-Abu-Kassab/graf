import 'package:flutter/material.dart';
class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}
List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}
class Car {

  String brand;
  String model;
  double price;
  List<String> images;

  Car(this.brand, this.model, this.price, this.images);

}
List<Car> getCarList(){
  return <Car>[
    Car(
      "Land Rover",
      "Discovery",
      100,
      [
        "assets/land_rover_0.png",
        "assets/land_rover_1.png",
      ],
    ),
  ];
}



