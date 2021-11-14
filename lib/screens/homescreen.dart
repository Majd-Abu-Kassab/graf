// screen that have on button for renting a car
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:Color(0xFF1004d1)
                ),
                onPressed: () {},
                child: Text('RENT!',
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
