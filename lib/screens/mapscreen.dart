import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:lottie_animation/screens/Car_info_screen.dart';
import 'test.dart';


import 'menu.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool markerTapped=false;

  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  final Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: markerTapped ? CarInfo() :null,
        drawer: NavDrawer(),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0xFF90ADC6),
          title: Align(
            alignment: Alignment(-0.4, 0.0,),
            child: const Text('PARKKING MAP'),
          ),
        ),
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: _initialcameraposition),
                mapType: MapType.normal,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                padding: EdgeInsets.only(top: 700.0,),
                markers: getmarkers(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId("myMarker"),
        position: LatLng(32.5419299, 35.8546362), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        onTap: (){
          setState(() {
            print('test');
            markerTapped=true;
          });
        },
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markerTapped=false;
      //add second marker
      markers.add(Marker(
        markerId: MarkerId("myMarker2"),
        position: LatLng(32.5416707,35.853476), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Car ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      //add three marker
      markers.add(Marker(
        markerId: MarkerId("myMarker3"),
        position: LatLng(32.5412920,35.8519215), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Car ',
          snippet: '3',
          onTap: (){
            Text('Marker');
          }
        ),

        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      // add fourth marker:
      markers.add(Marker(
        markerId: MarkerId("myMarker4"),
        position: LatLng(32.5425822,35.8542537), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Car ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    });


    return markers;
  }
}