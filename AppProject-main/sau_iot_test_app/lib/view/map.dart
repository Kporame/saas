import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.707071, 100.356750),
    zoom: 14.4746,
  );

  // Add a marker for a specific location
  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('myLocation'),
      position: LatLng(13.707071, 100.356750),
      infoWindow: InfoWindow(
        title: 'My Location',
        snippet: 'This is where I am',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 230, 230, 230),
        title: Text(
          'GPS',
          style: GoogleFonts.lemon(),
        ),
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: _markers, // Add markers to the map
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
