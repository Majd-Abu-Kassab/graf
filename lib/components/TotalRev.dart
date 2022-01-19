// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Total extends StatefulWidget {
  const Total({Key key}) : super(key: key);

  @override
  _TotalState createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  Widget build(BuildContext context) {
    String totalSells ='0';
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEC),
     body: Column(
       children: [
         Container(
           margin: EdgeInsets.only(top: 10.0),
           padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
           width:600,
           height: 60,
           decoration: BoxDecoration(
             color: Color(0xFFE9EAEC),
             borderRadius: BorderRadius.all(Radius.circular(5)),
           ),
           child:Text('Total Sales:',
             style: TextStyle(
               decoration: TextDecoration.none,
               fontSize: 25.0,
               fontWeight: FontWeight.bold,
               color: Colors.blueGrey,
             ),
           ),
         ),
         StreamBuilder<QuerySnapshot>(
             stream: FirebaseFirestore.instance.collection('Orders').snapshots(),
             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
               if (snapshot.hasError) {
                 return Text('Something went wrong');
               }

               if (snapshot.connectionState == ConnectionState.waiting) {
                 return Text("Loading");
               }
               if(!snapshot.hasData ) return Text('no data');
               return ListView.builder(
                   padding: new EdgeInsets.all(8.0),
                   itemCount: snapshot.data.docs.length,
                   itemBuilder: (context, index) {
                     DocumentSnapshot info = snapshot.data.docs[index];
                     totalSells=totalSells+info['amount'];
                     return Text('total'+info['amount']);
                   });
             }),
         // Text('total'+totalSells),
       ],
     )
    );
  }
}
