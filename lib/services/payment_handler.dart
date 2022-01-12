import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie_animation/models/user.dart';
import 'package:lottie_animation/screens/test.dart';



class BillingFields{
  static String get firstName => 'firstName';
  static String get lastName => 'lastName';
  static String get streetAddress => 'streetAddress';
  static String get locality => 'locality';
  static String get postalCode => 'postalCode';
  static String get region => 'region';
}


class PaymentHandler {
  final kWebBraintreeLink='https://us-central1-parkking-ac6fa.cloudfunctions.net';
  static final String kWebBraintreeToken = 'sandbox_jyvyvxfx_prggfcx7z89rz3zn';

  final AppUser model = AppUser();
  var headers = {
    'content-type': 'application/json',
  };
  var token = kWebBraintreeToken;

  void getClientToken(context) async {
    var customerId = model.Uid;
    if (customerId != '') {
      var res = await http.get(
          Uri.parse('$kWebBraintreeLink/widgets/token/$customerId'),
          headers: headers);
      if (res.statusCode == 200) {
        var x = jsonDecode(res.body);
        token = x['token'] ?? token;
      }
    }
    if (!kIsWeb) getMobilePaymentNonce(context);

  }

  void getMobilePaymentNonce(context) async {
    final request = BraintreeDropInRequest(
      amount: "4.8",
      vaultManagerEnabled: true,
      clientToken: token.toString(),
      collectDeviceData: true,
      paypalRequest: BraintreePayPalRequest(),
    );
    BraintreeDropInResult? result = await BraintreeDropIn.start(request);
    var nonce = result?.paymentMethodNonce.nonce;
    print(nonce);
    checkout(nonce!);
  }

  void checkout(String nonce) async {
    bool newUser = false;
    if (model.Uid != '') {
      var res = await http.get(
          Uri.parse('$kWebBraintreeLink/widgets/customer/${model.Uid}'),
          headers: headers);
      if (res.body.contains('notFoundError')) {
        var userData = {
          "id": model.Uid,
          BillingFields.firstName: 'nassem',
          BillingFields.lastName:  'hasasneh',
          BillingFields.streetAddress: 'amman',
          BillingFields.locality:  'amman',
          BillingFields.region: 'jordan',
          BillingFields.postalCode:  '200921',
          "payment_method_nonce": nonce
        };
        var res = await http.post(
            Uri.parse('$kWebBraintreeLink/widgets/create-customer'),
            headers: headers,
            body: json.encode(userData));
        if (res.statusCode != 200) {
          throw Exception('http.post error: statusCode= ${res.statusCode}');
        }
        var transactionData = {"amount": 4.80, "customerId": model.Uid};
        res = await http.post(
            Uri.parse('$kWebBraintreeLink/widgets/checkout-id'),
            headers: headers,
            body: json.encode(transactionData));
        if (res.statusCode != 200) {
          throw Exception('http.post error: statusCode= ${res.statusCode}');
        }
        newUser = true;
      }
    }
    if (!newUser) {
      var transactionData = {
        "amount": 4.80,
        "payment_method_nonce": nonce,
      };
      var res = await http.post(
          Uri.parse('$kWebBraintreeLink/widgets/checkout'),
          headers: headers,
          body: json.encode(transactionData));
      if (res.statusCode != 200) {
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      }
    }

  }
}
