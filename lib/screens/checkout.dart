import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:lottie_animation/models/chechoutconst.dart';
import 'package:lottie_animation/services/payment_handler.dart';

class Checkout extends StatelessWidget {
  final DocumentSnapshot info;

  const Checkout({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  //height: getProportionateScreenWidth(40),
                  //width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  //color: kTextColor,
                )
              ],
            ),
            //SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "JD${info['Price'].toString()}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    //width: getProportionateScreenWidth(190),
                    child: ElevatedButton(
                      child: Text('Check Out'),
                      onPressed: () {
                        PaymentHandler(amount:info['Price'].toString(),carDetails: info['Name'] + '-'+ info['Model'] + '-'+ info['Color']).getClientToken(context);
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
