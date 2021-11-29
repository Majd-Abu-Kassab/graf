import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie_animation/screens/signinorregister.dart';


class Profile extends StatelessWidget {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Stack(
          children: <Widget>[
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition:CameraPosition(target: _initialcameraposition),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
            ),
            // align it to the bottom center, you can try different options too (e.g topLeft,centerLeft)
            Align(
              alignment: Alignment.bottomRight,
              // add your floating action button
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.menu),
              ),
            ),
          ],
        ),
    );
  }
}