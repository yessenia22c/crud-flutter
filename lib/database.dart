import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqlite_api.dart';


class DBProvider {

  DBProvider._();
  static final DBProvider bd = DBProvider._();

  
  //late se inicia despues pero antes de su primer uso
  late Database _database;

  
  Future<Database> get database async { 
    if (_database != null) 
    {
      return _database;
    }
    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "db_ejemplo.db");
    return await openDatabase(path,
        version: 1, onOpen: (db) {}, onCreate: _createTables);
  }


  void _createTables(Database db, int version) async {

    await db.execute("CREATE TABLE usuarios ("
        "id INTEGER NOT NULL PRIMARY KEY,"
        "nompresapellidos VARCHAR(100)  NOT NULL,"
        "correo VARCHAR(50) NOT NULL,"
        "telefono VARCHAR(50) NULL,"
        "estado INTEGER)");

  }


    /*newUsuarios(Codificadores newCodificadores) async {

    final db = await database;
    var res =   await db.rawInsert(
        "INSERT OR REPLACE INTO codificadores (id, clasificador_id, nombre, removed, observacion,estado)"
        " VALUES (?,?,?,?,?,?)",
        [
          newCodificadores.id,
          newCodificadores.clasificadorid,
          newCodificadores.nombre,
          newCodificadores.removed,
          newCodificadores.observacion,
          newCodificadores.estado
        ]);
    return res;
  }
  
    getCodificadoresAll(String id) async {
      final db = await database;
      var res = await db.query("codificadores",where: "clasificador_id = ?", whereArgs: [id]);
      //List<Codificadores> list = res.isNotEmpty ? res.map((c) => Codificadores.fromMap(c)).toList() : [];
      var lista = json.encode(res); 
      return lista;
  }

  
  
  */


}

