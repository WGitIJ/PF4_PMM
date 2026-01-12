import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  // Patron Singleton
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database == null) _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    //OBTENER LA RUTA DONDE COLOCAR LA BASE DE DATOS
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print("La ruta es:" + path);

    //CREACION BASE DE DATOS
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans ('
          'id INTEGER PRIMARY KEY,'
          'tipus TEXT,'
          'valor TEXT'
          ')');
    });
  }

  // Hay dos formas de insertar datos
  //!! INSERCION RAW
  Future<int> insertRawScan(ScanModel newScan) async {
    final id = newScan.id;
    final tipus = newScan.tipus;
    final valor = newScan.valor;

    final db = await database;

    final res = await db.rawInsert("INSERT INTO Scans (id, tipus, valor) "
        "VALUES ($id, '$tipus', '$valor')");

    return res;
  }

  //!! INSERCION CON METODO INSERT
  Future<int> insertScan(ScanModel newScan) async {
    final db = await database;
    final res = await db.insert('Scans', newScan.toMap());
    // Devuelve el id del último registro insertado
    print(res);
    return res;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((e) => ScanModel.fromMap(e)).toList() : [];
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    if(res.isNotEmpty){
      return ScanModel.fromMap(res.first);
    } else {
      return null;
    }
  }

  Future<int> updateScan(ScanModel updatedScan) async {
    final db = await database;
    final res = await db.update('Scans', updatedScan.toMap(),
        where: 'id = ?', whereArgs: [updatedScan.id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<List<ScanModel>> getScansByType(String tipus) async {
    final db = await database;
    final res = await db.query('Scans', where: 'tipus = ?', whereArgs: [tipus]);
    return res.isNotEmpty ? res.map((e) => ScanModel.fromMap(e)).toList() : [];
  }



} 
