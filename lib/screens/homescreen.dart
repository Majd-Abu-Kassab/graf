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
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
                  primary:Color(0xFF1004d1),
                  fixedSize: const Size(240, 80),
                ),
                onPressed: () {},
                child: Text('RENT',style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
