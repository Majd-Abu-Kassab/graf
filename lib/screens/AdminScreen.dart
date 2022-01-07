import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text(
        'this is admin screen'
      ),
    );
  }
}
