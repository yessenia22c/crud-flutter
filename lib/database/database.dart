import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ejemplo/models/usuarios.dart';

import 'dart:convert';
import 'dart:io';

//import 'package:path_provider/path_provider.dart';
//import 'package:sqflite/sqlite_api.dart';


class DBProvider {


static final DBProvider instance = DBProvider._init();
  static Database? _database;

  DBProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    
    _database = await _initDB('mydatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onOpen: (db) {},onCreate: _createTables);
  }
  

  /*initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // creando una ruta con el nombre de la base de datos
    String path = join(documentsDirectory.path, "db_ejemplo.db");

    return await openDatabase(
        path,
        version: 1, 
        onOpen: (db) {}, 
        onCreate: _createTables
        );
  } */





  void _createTables(Database db, int version) async {

    await db.execute("CREATE TABLE usuarios ("
        "id INTEGER NOT NULL PRIMARY KEY,"
        "nombre VARCHAR(100)  NOT NULL,"
        "correo VARCHAR(50) NOT NULL,"
        "password VARCHAR(50) NULL,"
        "telefono VARCHAR(50))");


    await db.execute("CREATE TABLE tipo_usuario ("
        "id INTEGER NOT NULL PRIMARY KEY,"
        "nombretipo_usuario VARCHAR(100)  NOT NULL);");


    await db.execute("INSERT OR REPLACE INTO tipo_contacto (id, nombre_tc) VALUES (1,Administrador); "
    "INSERT OR REPLACE INTO tipo_contacto (id, nombre_tc) VALUES (2,Cliente); "
    "INSERT OR REPLACE INTO tipo_contacto (id, nombre_tc) VALUES (3,Invitado); "
    );

  }


  // registrar Usuario
  guardarUsuarios(User newUsario) async {
    final db = await database;
    var res =   await db.rawInsert(
      
        "INSERT OR REPLACE INTO usuarios (id, nombre, correo, password, telefono)"
        " VALUES (?,?,?,?,?)",
        [
          newUsario.id,
          newUsario.nombre,
          newUsario.email,
          newUsario.password,
          newUsario.telefono
          
        ]);
    return res;
  }

  // obterner un usuario por correo
  getUsuarioporCodigo(String correo) async { 
      final db = await database;
      var res = await db.query("usuarios",where: "correo = ?", whereArgs: [correo]);
      var lista = json.encode(res); 
      return lista;
  }


  // actualizar un usuario
  updateUsuario(User newUsuario) async {
    final db = await database;
    var res = await db.update("usuarios", newUsuario.toMap(),
        where: "id = ?", whereArgs: [newUsuario.id]);
    return res;
  }




  
  

  
}

