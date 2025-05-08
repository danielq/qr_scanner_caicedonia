import 'package:flutter/material.dart';
import 'package:qr_scanner_caicedonia/models/scan_model.dart';
import 'package:qr_scanner_caicedonia/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DbProvider.db.nuevoScan(nuevoScan);
    // asignar el ID de la base de datos al modelo
    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    var scans = await DbProvider.db.getTodosLosScans();
    scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    var scans = await DbProvider.db.getScansPorTipo(tipo);
    scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DbProvider.db.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  borrarScansPorId(int id) async {
    await DbProvider.db.deleteById(id);
  }
}
