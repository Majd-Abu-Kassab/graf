import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie_animation/screens/carData.dart';
import 'package:pay/pay.dart';

import 'car_widget.dart';

class CarInfo extends StatelessWidget {
  final _paymentItems = <PaymentItem>[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
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
                children:[
                  Expanded(
                    child: Row(
                        children: [
                          GooglePayButton(
                            paymentConfigurationAsset: 'gpay.json',
                            paymentItems: _paymentItems,
                            width: 200,
                            height: 50,
                            style: GooglePayButtonStyle.black,
                            type: GooglePayButtonType.pay,
                            margin: const EdgeInsets.only(top: 15.0),
                            onPaymentResult: (data) {
                              print(data);
                            },
                            loadingIndicator: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        ],
                      )
                    ),
                ]),
          ),
        ),
      ),
    );
  }
}


