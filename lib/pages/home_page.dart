import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner_caicedonia/models/scan_model.dart';
import 'package:qr_scanner_caicedonia/pages/pages.dart';
import 'package:qr_scanner_caicedonia/providers/db_provider.dart';
import 'package:qr_scanner_caicedonia/providers/ui_providers.dart';
import 'package:qr_scanner_caicedonia/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text('Historial'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationbar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    // cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    // TODO: temporal para leer la base de datos
    // final tempScan = new ScanModel(valor: 'https://www.google.com');
    // DbProvider.db.nuevoScan(tempScan);
    // DbProvider.db.getScanbyId(14).then((scan) => print(scan?.valor));
    // DbProvider.db.deleteAllScanRaw().then(print);
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
