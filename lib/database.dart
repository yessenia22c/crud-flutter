import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ejemplo/usuarios.dart';

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqlite_api.dart';


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
    //si no esta creada la base de datos la crea
    _database = await initDB();
    return _database;
  }


  initDB() async {

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // creando una ruta con el nombre de la base de datos
    String path = join(documentsDirectory.path, "db_ejemplo.db");

    return await openDatabase(
        path,
        version: 1, 
        onOpen: (db) {}, 
        onCreate: _createTables
        );

  }


  void _createTables(Database db, int version) async {

    await db.execute("CREATE TABLE usuarios ("
        "id INTEGER NOT NULL PRIMARY KEY,"
        "nombre VARCHAR(100)  NOT NULL,"
        "correo VARCHAR(50) NOT NULL,"
        "password VARCHAR(50) NULL,"
        "telefono VARCHAR(50))");

  }

  guardarUsuarios(User newUsario) async {

    final db = await database;
    var res =   await db.rawInsert(
        "INSERT OR REPLACE INTO usuarios (id, nombre, correo, password, telefono)"
        " VALUES (?,?,?,?,?)",
        [(
          newUsario.id,
          newUsario.nombre,
          newUsario.email,
          newUsario.password,
          newUsario.telefono
          )
        ]);
    return res;
  }


  guardarUsuariosok() async {

      print('llama ok'); 
  }



  
  

  
}

