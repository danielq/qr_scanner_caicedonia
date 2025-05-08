import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_caicedonia/providers/scan_list_provider.dart';
import 'package:qr_scanner_caicedonia/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3d8bef', 'Cancelar', false, ScanMode.QR);
        final barcodeScanRes = '4.3293698,-75.8266105';
        if (barcodeScanRes == "-1") {
          return;
        }
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        launchURL(nuevoScan, context);
      },
    );
  }
}
