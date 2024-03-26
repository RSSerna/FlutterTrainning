import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:qr_db_app/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory directoryPath = await getApplicationDocumentsDirectory();
    final path = join(directoryPath.path, 'ScansDB.db');
    print(path);
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
        ''');
      },
    );
  }

  Future<int> nuevoScanRaw(ScanModel scanModel) async {
    final id = scanModel.id;
    final tipo = scanModel.tipo;
    final valor = scanModel.valor;

    final Database db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Scans( id, tipo, valor)
      VALUES($id,'$tipo','$valor')
    ''');

    return res;
  }

  Future<int> nuevoScan(ScanModel scanModel) async {
    final Database db = await database;
    final res = db.insert('Scans', scanModel.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final Database db = await database;
    final List<Map<String, Object?>> res =
        await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromMap(res.first) : null;
  }

  Future<List<ScanModel>?> getScanByTipo(String tipo) async {
    final Database db = await database;
    final List<Map<String, Object?>> res =
        await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromMap(e)).toList()
        : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final Database db = await database;
    final List<Map<String, Object?>> res = await db.query('Scans');
    return res.isNotEmpty
        ? res.map((e) => ScanModel.fromMap(e)).toList()
        : null;
  }

  Future<int> updateScan(ScanModel scanModel) async{
    final Database db = await database;
    final res = db.update('Scans', scanModel.toMap(), where: 'id = ?', whereArgs: [scanModel.id]);
    return res;
  }

  Future<int> deleteScan(int id) async{
    final Database db = await database;
    final res = db.delete('Scans' , where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async{
    final Database db = await database;
    final res = db.delete('Scans');
    return res;
  }
}
