import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String nombre;
  String email;
  String username;
  int estado;
  
  User({
    this.id=0,
    this.nombre='',
    this.email='',
    this.username='',
    this.estado=0
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nombre: json["nombre"],
    email: json["email"],
    username: json["username"],
    estado: json["estado"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "email": email,
    "username": username,
    "estado": estado,
  };
}

