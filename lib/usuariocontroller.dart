
import 'dart:convert';
import 'dart:io';

import 'package:ejemplo/database.dart';
import 'package:flutter/cupertino.dart';



class UsuarioController{

  late BuildContext context;

void prueba()
{
   
   //print('llama');
    try{
        
                 // VeTrampas tramp = new VeTrampas.fromMap(trampa);

                  final res =  DBProvider.bd.guardarUsuariosok();

              
              
                }catch(e){
                  print('Error:$e');
              
                }
   
}

}

