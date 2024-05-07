import 'package:ejemplo/usuariocontroller.dart';
import 'package:flutter/material.dart';
import 'package:ejemplo/database.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});

 // UsuarioController _uc = new UsuarioController();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'CRUD Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 50, 148, 101)),
        useMaterial3: true,
      ),
     
      home: const MyHomePage(title: 'CRUD'),
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  
  UsuarioController _uc = new UsuarioController();

  @override
  Widget build(BuildContext context) {

  
    
    return Scaffold(
      appBar: AppBar(
          title: Text('Formulario'),
        ),
        
        
        
        body: ListView(
          
          padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
          
          children: [
            _crearNombre(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearTelefono(),
            Divider(),
            _botonRegistrar(),
            //llamar a otro widget

          ],

        )
        
    );
  }

  Widget _crearNombre() {

    return TextField(
      textCapitalization: TextCapitalization.words,
      maxLength: 10,
      keyboardType: TextInputType.name,
      //conexion al controlador
      controller: _uc.nombreapellido_con,
      decoration: InputDecoration(
        border: OutlineInputBorder(     // Establece un borde cicular/otro  alrededor de la caja de texto
          borderRadius: BorderRadius.circular(15.0),
        ),
        counterText: 'Número de caracteres: 0',   // Texto que aparece a la derecha y debajo de la caja
        hintText: 'Nombres y Apellidos',          // Texto que aparece dentro de la caja y desaparece al escribir
        labelText: 'Nombre',                      // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
        helperText: 'Introduce nombre y apellido',  // Texto que aparece a la izquierda y abajo de la caja
        suffixIcon: Icon(Icons.accessibility_new),     // Widget que aparece a la derecha dentro de la caja
        icon: Icon(Icons.accessibility),          // Widget que aparece a la izquierda fuera de la caja

      ),
    );

  }


   Widget _crearEmail(){

    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _uc.correo_con,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        )
      ),
    );
  }


  Widget _crearPassword(){

    return TextField(
      obscureText: true,
      obscuringCharacter: '-',
      controller: _uc.password_con,
      maxLength: 20,
      decoration: InputDecoration(
          hintText: 'Password de entrada',
          labelText: 'Password',
          suffixIcon: Icon(Icons.password),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          )
      ),
    );
  }



  Widget _crearTelefono()
  {
      return TextField(
      textCapitalization: TextCapitalization.words,
      maxLength: 10,
      controller: _uc.telefono_con,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(     // Establece un borde cicular/otro  alrededor de la caja de texto
          borderRadius: BorderRadius.circular(15.0),
        ),
        counterText: 'Número de caracteres: 0',   // Texto que aparece a la derecha y debajo de la caja
        hintText: 'Telefono',          // Texto que aparece dentro de la caja y desaparece al escribir
        labelText: 'Telefono',                      // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
        helperText: 'Introduce el telefono',  // Texto que aparece a la izquierda y abajo de la caja
        suffixIcon: Icon(Icons.phone),     // Widget que aparece a la derecha dentro de la caja
        icon: Icon(Icons.phone),          // Widget que aparece a la izquierda fuera de la caja

      ),
    );
  }

 
  Widget _botonRegistrar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
      child: ElevatedButton.icon(
      
        // EVENTO
        onPressed: () {
          
          // OBJETO DEL TIPO USUARIO CONTROLER           
          _uc.guardarUsuarioController();

        } ,
        label: Text('REGISTRAR'),
        icon: Icon(Icons.save),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 8)),
      ),
    );
  }



}