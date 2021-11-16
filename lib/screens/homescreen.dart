// screen that have on button for renting a car
import 'package:flutter/material.dart';
import 'package:lottie_animation/screens/mapscreen.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Button1());
  }
}

class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333652),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: Colors.amberAccent,
                  fixedSize: const Size(240, 80),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> mapscreen()));
                },
                child: Text(
                  'RENT!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
