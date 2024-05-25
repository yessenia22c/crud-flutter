import 'dart:ui';
import 'package:ejemplo/controllers/usuariocontroller.dart';
import 'package:ejemplo/pages/principal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ejemplo/pages/register_user_page.dart';

// clase Login Page

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Interacción con los controladores de una o mas clases si interactua la clase
  //UsuarioController _con=new UsuarioController();
  //AuthController _con = new AuthController();

  UsuarioController _uc = new UsuarioController();
  
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      // Inicializador del controlador
      //_con.init(context,refresh);
    });
  }

  // construye la pantalla.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Selecciona un rol'),
      // ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  //llama a los widgets de la página
                  _textTitulo(),
                  _textFieldUser(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _buttonRegister(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// widget Titulo
  Widget _textTitulo() {
    return Container(
      margin: EdgeInsets.only(
          top: 150, bottom: 50 //MediaQuery.of(context).size.height*0.17
          ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Aplicación Agenda de Contactos',
            textAlign: TextAlign.center,
            style: TextStyle(
                //color: MyColors.thirdColor,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // widget Usuario
  Widget _textFieldUser() {
    return Container(
      
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            // color:MyColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
          //obscureText: true,
          controller: _uc.correo_con,// interacción ,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              color: Colors.green,
            ),
            labelText: 'Usuario',
          ),
        ));
  }

  Widget _textFieldPassword() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            // color:MyColors.primaryOpacityColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextField(
          
          //controller:_con.PasswordController,// _con.passwordController,
          obscureText: true,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2.0),
            ),
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              color: Colors.green,
            ),
            labelText: 'Contraseña',
          ),
        )

        /*TextField(
        //controller: _con.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
               // color:MyColors.primaryColorDark
            ),
            prefixIcon: Icon(
                Icons.lock,
              //  color:MyColors.primaryColor )
        ),
      ),
      )*/

        );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
      child: ElevatedButton(
        onPressed: () async {
          final iniciaSesion = await _uc.iniciarSesionController();
          //print(iniciaSesion);
          // obteer el texto del textfieldUser
          
          if (iniciaSesion != null) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => PrincipalPage(),
              ),
              (Route<dynamic> route) => false,
            );
          } else {
            _showMyDialog();
            print('Usuario no encontrado');
             
          }
        },
        child: Text('INGRESAR'),
        style: ElevatedButton.styleFrom(
            //primaryColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 8)),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
      child: ElevatedButton(
        onPressed: () async {
          //await _con.iniciarsesion();

          // Navegación a otra pantalla
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => RegisterUserPage(),
            ),
            (Route<dynamic> route) => false,
          );

          //
        },
        child: Text('Crear Cuenta'),
        style: ElevatedButton.styleFrom(
            //primaryColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(vertical: 8)),
      ),
    );
  }
  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Incio fallido'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Error al iniciar sesión'),
              Text('No se ha encontrado el usuario'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Volver a intentar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  /*Widget _textTienesProblemas(){
    return   Container(
      margin: EdgeInsets.only(
          top: 20,
          bottom:10//MediaQuery.of(context).size.height*0.17
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '¿Tiene problemas para ingresar?',
            style: TextStyle(
                color: MyColors.secondaryColor,
                fontSize: 15,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }*/

  void refresh() {
    setState(() {});
  }
}
