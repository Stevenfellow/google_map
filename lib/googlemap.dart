import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapp extends StatefulWidget {
  const GoogleMapp({super.key});

  @override
  State<GoogleMapp> createState() => _GoogleMappState();
}

class _GoogleMappState extends State<GoogleMapp> {
  late GoogleMapController mapController;
  final Location _location = Location();
  final LatLng _center = const LatLng(0.347596, 32.582520);

  late double latitude;

  late double longitude;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _location.onLocationChanged.listen((l) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(latitude, longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
        myLocationEnabled: true,
      ),
    );
  }
}
