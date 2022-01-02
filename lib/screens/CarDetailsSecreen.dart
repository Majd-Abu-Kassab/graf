import 'package:flutter/material.dart';
import 'package:lottie_animation/models/Constants.dart';
import 'package:lottie_animation/screens/AvailableCars.dart';
import 'package:lottie_animation/models/Car.dart';

import 'CarBlock.dart';


class CarDetailsScreen extends StatefulWidget {
  CarDetailsScreen({required this.car});
  final Car car;

  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            CarBlock(widget.car),
            Divider(),
            TextButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return TermsScreen(car: widget.car);
                // }));
              },
              child: ListTile(
                title: Text("Rental terms"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Divider(),
            SizedBox(
              height: kInputSpacing,
            ),
            Padding(
              padding: kFixedButtonPadding,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchResultsScreen();
                  }));
                },
                child: Text(
                  'Book now, pay later!',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}