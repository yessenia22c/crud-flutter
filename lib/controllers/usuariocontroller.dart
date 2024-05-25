import 'dart:convert';
import 'dart:io';

import 'package:ejemplo/database/database.dart';
import 'package:ejemplo/models/usuarios.dart';
import 'package:flutter/cupertino.dart';

class UsuarioController {
  late BuildContext context;

  TextEditingController nombreapellido_con = new TextEditingController();
  TextEditingController correo_con = new TextEditingController();
  TextEditingController password_con = new TextEditingController();
  TextEditingController telefono_con = new TextEditingController();

  dynamic guardarUsuarioController() {
    //print('llega al controlador');

    try {
      // VeTrampas tramp = new VeTrampas.fromMap(trampa);

      // Crear un objeto de la clase Modelo Usuario
      User usuario = new User();

      // setearle atributos
      //usuario.id = 1;
      usuario.nombre = nombreapellido_con.text.trim(); //'Milena Cuellar';
      usuario.email = correo_con.text.trim(); //'milena.cuellar@est.emi.edu.bo';
      usuario.password = password_con.text.trim(); //'123456';
      usuario.telefono = telefono_con.text.trim(); //'6993939';

      // crear una instancia de la clase BD PROVIDER
      final res = DBProvider.instance.guardarUsuarios(usuario);

      if (res != null) {
        print('Usuario guardado');
        return res;
      } else {
        print('Error al guardar usuario');
        return null;
      }
    } catch (e) {
      print('Error:$e');
    }
  }

  iniciarSesionController() async {
    try {
      //print('llega al controlador');
      //print('correo: ${correo_con.text.trim()}');
      //print('password: ${password_con.text.trim()}');
      var res =
          await DBProvider.instance.getUsuarioporCorreo(correo_con.text.trim());
      print(res);
      print(correo_con.text.trim());
      return res != null || res != Null ? res : null;
    } catch (e) {
      print('Error:$e');
    }
  }
//insertar o actualizar

//eliminar

//listar
  listarUsuariosController() async {
    try {
      var res = await DBProvider.instance.listarUsuarios();
      if (res != null && res != []) {
        //print('ENTRA AQUI Y RESPONDE_ ');
        //print(res);
        return res;
      }else{
        print('NO HAY USUARIOS');
        return null;
      }
    } catch (e) {
      return ('ESTE ES EL Error:$e');
    }
  }
}
