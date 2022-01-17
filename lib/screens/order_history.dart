import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie_animation/models/order_model.dart';

class OrderHistory extends StatelessWidget {
  OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEC),
      appBar: AppBar(
        backgroundColor: Color(0xFF90ADC6),
        title: Align(
            alignment: Alignment(
              -0.3,
              0.0,
            ),
            child: Text("Order History")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getOrdersFirebase(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData && snapshot.data != []) {
                return ListView.builder(
                  itemBuilder: (context, int) {
                    return SizedBox(
                      height: 100.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Order # '),
                                  Text(snapshot.data[int].id),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Date '),
                                  Text(snapshot.data[int].date),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text('Car Model: '),
                                  Text(snapshot.data[int].carDetails),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Amount: '),
                                  Text(snapshot.data[int].amount),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              }
              else
                return Container();
            }
        ),
      ),
    );
  }
}
final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
Future<List<Order>> getOrdersFirebase() async {
  var customerId = auth.currentUser?.uid ?? '';
  List<Order> _allOrders = [];
  QuerySnapshot<Map<String, dynamic>>? _querySnapshot;
  _querySnapshot = await _fireStore.collection('Orders').where('customerId',isEqualTo: customerId).get();
  List<QueryDocumentSnapshot> _docs = _querySnapshot.docs;
  if (_docs.isNotEmpty) {
    _allOrders = _docs.map((QueryDocumentSnapshot doc) {
      return Order.fromFirestore(doc);
    }).toList();
  }
  return _allOrders;
}