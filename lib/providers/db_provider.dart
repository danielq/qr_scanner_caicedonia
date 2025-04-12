import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database? _database;
  static DbProvider db = DbProvider._();
  DbProvider._();
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
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
}
