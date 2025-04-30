import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner_caicedonia/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database? _database;
  static DbProvider db = DbProvider._();
  DbProvider._();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database?> initDB() async {
    // path donde vamos a almacenar la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // creacion de la base de datos
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    // crear la tabla
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
      ''');
    });
  }

  Future<int> nuevoScanFRaw(ScanModel nuevoScan) async {
    // verificar la base de datos
    final db = await database;
    final res = await db.rawInsert('''
      "insert into Scans(id,tipo,valor)" 
        "values(${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}')"
      ''');
    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanbyId(int id) async {
    final db = await database;
    final res = await db!.query('Scans', where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db?.rawQuery('''
      Select * from Scans where tipo = '$tipo'
      ''');
    return res!.isNotEmpty
        ? res.map((e) => ScanModel.fromJson(e)).toList()
        : [];
  }

  // Future<List<ScanModel>?> getTodosLosScans() async {
  //   final db = await database;
  //   final res = db!.query('Scans');
  //   return res.;
  // }
}
