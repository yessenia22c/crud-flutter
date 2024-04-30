import 'package:flutter/material.dart';

void main() {
  runApp(const FormularioPage());
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({Key? key}) : super(key: key);

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
        
        appBar: AppBar(
          title: Text('Formulario'),
        ),
        
        
        
        body: ListView(
          
          padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
          
          children: [
            _crearInput(),    // TextField con múltiples opciones de decoración
            Divider(),
            _crearEmail(),
            Divider(),
            _crearTelefono(),
            Divider(),
            _crearPassword(),
            Divider(),
            //llamar a otro widget

          ],

        )
        );
  }


  Widget _crearEmail(){

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email del paciente',
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

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.words,
      maxLength: 10,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(     // Establece un borde cicular/otro  alrededor de la caja de texto
          borderRadius: BorderRadius.circular(15.0),
        ),
        counterText: 'Número de caracteres: 0',   // Texto que aparece a la derecha y debajo de la caja
        hintText: 'Nombre del paciente',          // Texto que aparece dentro de la caja y desaparece al escribir
        labelText: 'Nombre',                      // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
        helperText: 'Introduce el nombre del paciente',  // Texto que aparece a la izquierda y abajo de la caja
        suffixIcon: Icon(Icons.access_alarm),     // Widget que aparece a la derecha dentro de la caja
        icon: Icon(Icons.accessibility),          // Widget que aparece a la izquierda fuera de la caja

      ),
    );

  }



  Widget _crearTelefono()
  {
      return TextField(
      textCapitalization: TextCapitalization.words,
      maxLength: 10,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(     // Establece un borde cicular/otro  alrededor de la caja de texto
          borderRadius: BorderRadius.circular(15.0),
        ),
        counterText: 'Número de caracteres: 0',   // Texto que aparece a la derecha y debajo de la caja
        hintText: 'Nombre del paciente',          // Texto que aparece dentro de la caja y desaparece al escribir
        labelText: 'Telefono',                      // Texto qye aparece encima de la caja AL PULSAR EN EL INTERIOR PARA ESCRIBIR
        helperText: 'Intriduce el telefono',  // Texto que aparece a la izquierda y abajo de la caja
        suffixIcon: Icon(Icons.access_alarm),     // Widget que aparece a la derecha dentro de la caja
        icon: Icon(Icons.accessibility),          // Widget que aparece a la izquierda fuera de la caja

      ),
    );
  }

}