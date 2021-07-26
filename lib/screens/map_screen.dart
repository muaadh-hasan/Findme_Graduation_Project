import 'package:findme_gp_project/providers/location_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position currentPosition;

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      print("currentPosition.latitude**********************************");
      print(currentPosition.latitude);
      _markers.add(Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationProvider>(context, listen: false).locatePosition();
    currentPosition =
        Provider.of<LocationProvider>(context, listen: true).currentPosition;
    return Scaffold(
        body: Container(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition.latitude, currentPosition.longitude),
          zoom: 14.7,
        ),
        mapType: MapType.normal,
      ),
    ));
  }
}
