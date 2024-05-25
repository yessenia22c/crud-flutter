import 'dart:convert';

import 'package:ejemplo/controllers/usuariocontroller.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

final listaUsuarios = [
  {'nombre': 'Yessenia', 'correo': ' yesseniavillarte@gmail.com'},
  {'nombre': 'Matias', 'correo': 'yes@gmi.vom'}
];
var listaUsuariosArray = [];

class _PrincipalPageState extends State<PrincipalPage> {
  List<dynamic> listaUsuariosArray = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getUsuariosLista();
  }

  UsuarioController _uc = new UsuarioController();
  getUsuariosLista() async {
    var listaUsuarioBd = await _uc.listarUsuariosController();
    // setState(() {
      
    //   if (listaUsuarioBd != null) {
    //     listaUsuariosArray = listaUsuarioBd;
    //   } else {
    //     listaUsuariosArray = [];
    //   }
    // });
    if (listaUsuarioBd != null) {
      setState(() {
      isLoading = false;
      if (listaUsuarioBd != null) {
        listaUsuariosArray = jsonDecode(listaUsuarioBd);
      } else {
        listaUsuariosArray = [];
      }
    });
      //print('MI LISTA USER $listaUsuarioBd');
      return listaUsuarioBd;
    } else {
      print('No hay usuarios en la base de datos');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //getUsuariosLista();
    print('MI LISTA USER POR FIN $listaUsuariosArray');
    //final listaUsuariosBd = getUsuariosLista();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 10), // Espacio vacío para centrar
            Text(
              'Lista de Usuarios',
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 10), // Espacio vacío para centrar
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40, // Ajustar el alto del contenedor
              child: TextField(
                style: const TextStyle(
                    color: Colors.grey), // Color del texto gris (plomo)
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Codigo de Usuario',
                    hintStyle: TextStyle(
                        color: Colors.grey), // Color de la pista gris (plomo)
                    //border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white, // Color de fondo blanco
                    // contentPadding: EdgeInsets.all( 10),
                    isDense: true),

                onChanged: (text) async {
                  // Simulamos una operación asincrónica que toma tiempo
                  /* await Future.delayed(Duration(seconds: 1));
                print(text);
                _con.trampas=[];
                CodigoTexto=text.toUpperCase();
                await _con.getTrampas(1,CodigoTexto,'0','0','0').then((value) => refresh());*/
                },

                onSubmitted: (String value) async {
                  // Esta función se ejecutará cuando el usuario presione "Aceptar" en el teclado
                  //  _con.trampas=[];
                  // CodigoTexto=value.toUpperCase();
                  // await _con.getTrampas(1,CodigoTexto,"0","0","0").then((value) => refresh());
                },
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (result) async {
              // Lógica al seleccionar una opción del menú
              print("Opción seleccionada: $result");
              //openAlertBox();
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'filter',
                child: Text('Filtros'),
              ),
              /*PopupMenuItem<String>(
              value: 'opcion2',
              child: Text('Opción 2'),
            ),*/
            ],
          ),
        ],
        toolbarHeight: 120, // Ajusta el alto de la barra
      ),
      body: ListView.builder(
        //Listar lista de usuarios
        itemCount: listaUsuariosArray.length,

        itemBuilder: (context, index) {
          //print('MI LISTA JAJA ${listaUsuariosBd}');
          return ListTile(
            //Mostrar en el titulo el nombre del ListaUsuarios
            title: Text(listaUsuariosArray[index]['nombre']!),
            //title: Text('Usuario $index'),
            subtitle: Text(listaUsuariosArray[index]['correo']!),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Lógica al hacer clic en un elemento de la lista
              print('Usuario $index');
            },
          );
        },
      ), // Cierra el APP Bar
    );
  }
}
