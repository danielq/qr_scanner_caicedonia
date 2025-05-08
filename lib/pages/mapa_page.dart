import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_scanner_caicedonia/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  Widget build(BuildContext context) {
    // punto inicial de la camara
    final CameraPosition puntoInicial =
        CameraPosition(target: LatLng(4.3293698, -75.8266105), zoom: 14.5);
    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (arguments != null) {
      final ScanModel scan = arguments as ScanModel;
      return Scaffold(
          appBar: AppBar(
            title: const Text('Mapa'),
            backgroundColor: Colors.redAccent,
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: puntoInicial,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('NO DATA')),
    );
  }
}
