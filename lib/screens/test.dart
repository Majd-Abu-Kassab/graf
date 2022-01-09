// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// const kGoogleApiKey = "Api_key";
//
// GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: demo(),
//       ),
//     );
//   }
// }
//
// class demo extends StatefulWidget {
//   @override
//   demoState createState() => new demoState();
// }
//
// class demoState extends State<demo> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         body: Container(
//             alignment: Alignment.center,
//             child: RaisedButton(
//               onPressed: () async {
//                 // show input autocomplete with selected mode
//                 // then get the Prediction selected
//                 Prediction p = await PlacesAutocomplete.show(
//                     context: context, apiKey: kGoogleApiKey);
//                 displayPrediction(p);
//               },
//               child: Text('Find address'),
//
//             )
//         )
//     );
//   }
//
//   Future<Null> displayPrediction(Prediction p) async {
//     if (p != null) {
//       PlacesDetailsResponse detail =
//       await _places.getDetailsByPlaceId(p.placeId);
//
//       var placeId = p.placeId;
//       double lat = detail.result.geometry.location.lat;
//       double lng = detail.result.geometry.location.lng;
//
//       var address = await Geocoder.local.findAddressesFromQuery(p.description);
//
//       print(lat);
//       print(lng);
//     }
//   }
// }









// @dart=2.9
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tab demo"),
        bottom: new TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          return new Center(child: new Text(tab.text));
        }).toList(),
      ),

    );
  }
}