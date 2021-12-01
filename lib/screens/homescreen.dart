// screen that have on button for renting a car
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/screens/mapscreen.dart';

User loggedInUser;

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _auth = FirebaseAuth.instance;



  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Button1());
  }
}


// extendBodyBehindAppBar: true,
// appBar:AppBar(
// title: const Text('PARKKING MAP'),
class Button1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Color(0xFF90ADC6),
        title: Align(
            alignment: Alignment.center,
          child: const Text('PARKKING'),
        ),

      ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=> MapScreen()));
                },
                child: Text(
                  'RENT',
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
