import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_scan/models/scan_model.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {

  final Completer<GoogleMapController> _controller = Completer();

  MapType _mapType = MapType.normal; // 👈 FALTABA ESTO

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition _puntInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17,
      tilt: 50.0,
    );

    final Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('id1'),
        position: scan.getLatLng(),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () {
              _controller.future.then(
                (value) => value.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: scan.getLatLng(),
                      zoom: 17,
                      tilt: 50.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        markers: markers,
        mapType: _mapType,
        initialCameraPosition: _puntInicial,
        onMapCreated: (GoogleMapController controller) {
          if (!_controller.isCompleted) {
            _controller.complete(controller);
          }
        },
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _mapType = (_mapType == MapType.normal)
                ? MapType.hybrid
                : MapType.normal;
          });
        },
        child: const Icon(Icons.map),
      ),
    );
  }
}
