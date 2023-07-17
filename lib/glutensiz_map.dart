import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class GlutensizMap extends StatefulWidget {
  const GlutensizMap({super.key});

  @override
  State<GlutensizMap> createState() => _GlutensizMapState();
}

class _GlutensizMapState extends State<GlutensizMap> {
  double? latitude;
  double? longitude;
  GoogleMapController? googleMapController;
  late List<Restoran> list;
  Map<MarkerId, Marker> markers = {};
  
  static const String API_KEY = 'AIzaSyB4SDFmE10DyUXlNdosdvNo5cxAoLG_Xqo';

  @override
  void initState() {
    super.initState();
    list = [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          GoogleMap(
            zoomControlsEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
                target: LatLng(latitude != null ? latitude! : 0,
                    longitude != null ? longitude! : 0.0)),
            onMapCreated: (controller) {
              setState(() {
                googleMapController = controller;
                getLocation();
              });
            },
            markers: Set<Marker>.of(markers.values),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  getRestuarants();
                },
                mini: true,
                child: const Icon(Icons.download),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> getLocation() async {
    Location location = Location();

    PermissionStatus status = await location.hasPermission();
    if (status == PermissionStatus.granted) {
      LocationData locationData = await location.getLocation();
      setState(() {
        latitude = locationData.latitude;
        longitude = locationData.longitude;
        googleMapController!.moveCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(latitude!, longitude!), zoom: 15)));
      });
    } else {
      PermissionStatus reqPerm = await location.requestPermission();
      if (reqPerm == PermissionStatus.granted) {
        getLocation();
      } else {
        
        print('konum izni verilmedi');
      }
    }
  }

  Future<void> getRestuarants() async {
    if (latitude != null) {
      list.clear();
      var response = await http.get(Uri.parse(
          
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=${API_KEY}&location=$latitude,$longitude&radius=20000&type=restaurant&keyword=glutensiz'));
      var json = jsonDecode(response.body);
      var map = json as Map<String, dynamic>;
      var results = map['results'] as List;

      for (int i = 0; i < results.length; i++) {
        Map<String, dynamic> m = results[i];
        Map<String, dynamic> geometry = m['geometry'];
        Map<String, dynamic> location = geometry['location'];
        double lat = location['lat'];
        double long = location['lng'];
        String name = m['name'];

        var r = Restoran(lat, long, name);

        list.add(r);
      }

      for (int i = 0; i < list.length; i++) {
        Restoran restoran = list[i];
        var markerIdVal = MyWayToGenerateId();
        final MarkerId markerId = MarkerId(markerIdVal);

        final Marker marker = Marker(
          markerId: markerId,
          position: LatLng(restoran.latitude, restoran.longitude),
          infoWindow: InfoWindow(title: restoran.name),
          onTap: () {},
        );
        markers[markerId] = marker;
      }

      setState(() {
        googleMapController!.animateCamera(CameraUpdate.zoomTo(10));
      });
    }
  }

  
  String MyWayToGenerateId() {
    Random random = Random();
    var s = random.nextInt(100000);
    return s.toString();
  }
}

class Restoran {
  double latitude;
  double longitude;
  String name;

  Restoran(this.latitude, this.longitude, this.name);
}
