import 'package:ejemplo/controllers/usuariocontroller.dart';
import 'package:flutter/material.dart';


import 'package:ejemplo/pages/register_user_page.dart';
import 'package:ejemplo/pages/login_pages.dart';


//metod main que inicia la aplicacion
void main() {
  runApp(const MyApp());
}

// Clase MyAPP extiende de  State FulWidget https://medium.com/@jaimetellezb/flutter-statelesswidget-y-statefulwidget-2996883f2993
class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}


// clase de Estado de la aplicacion
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      //definimos cual es la página de Inicio
      home: const LoginPage(),
      
      //TItulo de pagina
      title: 'Ingreso y Registro',
      
      
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0)),

      //manejador de rutas de acceso a las paginas
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register':(BuildContext context)=>RegisterUserPage(),

        // En el caso de que se tenga subcarpetas dentro de otras de pages
        //'/inicio/principal': (BuildContext context) => const PrincipalPage(),

      },
    );
  }
}

