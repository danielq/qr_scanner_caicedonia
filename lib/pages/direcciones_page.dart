import 'package:flutter/material.dart';
import 'package:qr_scanner_caicedonia/widgets/scan_tiles.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'http');
  }
}
