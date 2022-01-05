import 'package:flutter/material.dart';
import 'package:lottie_animation/screens/Car_info_screen.dart';
import 'package:pay/pay.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _paymentItems = <PaymentItem>[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CarInfo());
  }
}
