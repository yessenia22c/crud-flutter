
import 'dart:convert';
import 'dart:io';

import 'package:ejemplo/database/database.dart';
import 'package:ejemplo/models/usuarios.dart';
import 'package:flutter/cupertino.dart';



class UsuarioController{

  late BuildContext context;

   TextEditingController nombreapellido_con = new TextEditingController();
   TextEditingController correo_con = new TextEditingController();
   TextEditingController password_con = new TextEditingController();
   TextEditingController telefono_con = new TextEditingController();


void guardarUsuarioController()
{
    //print('llega al controlador');
    
    try{               
                 // VeTrampas tramp = new VeTrampas.fromMap(trampa);
        
        // Crear un objeto de la clase Modelo Usuario
        User usuario = new User();

        // setearle atributos
        usuario.id = 1;
        usuario.nombre = nombreapellido_con.text.trim() ;//'Milena Cuellar';
        usuario.email = correo_con.text.trim();//'milena.cuellar@est.emi.edu.bo';
        usuario.password = password_con.text.trim();//'123456';
        usuario.telefono = telefono_con.text.trim();//'6993939';

        // crear una instancia de la clase BD PROVIDER
        final res =  DBProvider.instance.guardarUsuarios(usuario);
             
    }catch(e)
    
    {
       print('Error:$e');
    }
   
}

//insertar o actualizar

//eliminar

//listar


}

