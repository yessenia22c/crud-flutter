import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String nombre;
  String email;
  String password;
  String telefono;
  
  User({
    this.id=0,
    this.nombre='',
    this.email='',
    this.password='',
    this.telefono=''
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nombre: json["nombre"],
    email: json["email"],
    password: json["password"],
    telefono: json["telefono"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "email": email,
    "password": password,
    "telefono": telefono,
  };
}

