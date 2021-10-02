import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:Employee_Management/controller/hotelControllers.dart';
import 'package:provider/provider.dart';

final appKey = GlobalKey();

class mapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: appKey,
        appBar: AppBar(
          title: Text('Hotéis e Pousadas'),
        ),
        body: ChangeNotifierProvider<HoteisController>(
            create: (context) => HoteisController(),
            child: Builder(builder: (context) {
            final local = context.watch<HoteisController>();
        
          return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(19.018255973653343, 72.84793849278007),
            zoom: 18,
          ),
          zoomControlsEnabled: true,
          mapType: MapType.normal,
          myLocationEnabled: true,
          onMapCreated: local.onMapCreated,
          markers: local.markers,
        );
  } ),
  ),
  );
}
}