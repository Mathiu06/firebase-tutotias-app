// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String localIdB;
  String id;
  String apellido;
  String cedula;
  String celular;
  String descripcion;
  String email;
  double estrellas;
  String fotoUrl;
  double lat;
  double lon;
  // List<String> materias;
  String materia1;
  String materia2;
  String materia3;
  String materia4;
  String materia5;
  String nombre;
  bool online;
  double valor;
  bool tutor;
  bool disponible;
  String titulo;

  ProductoModel({
    this.localIdB = '',
    this.id,
    this.apellido = '',
    this.cedula = '',
    this.celular = '',
    this.descripcion = '',
    this.email = '',
    this.estrellas = 0.0,
    this.fotoUrl = '',
    this.lat = 0.0,
    this.lon = 0.0,
    // this.materias,
    this.materia1 = '',
    this.materia2 = '',
    this.materia3 = '',
    this.materia4 = '',
    this.materia5 = '',
    this.nombre = '',
    this.online = true,
    this.valor = 0.0,
    this.tutor = false,
    this.disponible = true,
    this.titulo = '',
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      new ProductoModel(
        localIdB: json["localIdB"],
        id: json["id"],
        apellido: json["apellido"],
        cedula: json["cedula"],
        celular: json["celular"],
        descripcion: json["descripcion"],
        email: json["email"],
        estrellas: json["estrellas"],
        fotoUrl: json["fotoUrl"],
        lat: json["lat"],
        lon: json["lon"],
        // materias: List<String>.from(json["materias"].map((x) => x)),
        materia1: json["materia1"],
        materia2: json["materia2"],
        materia3: json["materia3"],
        materia4: json["materia4"],
        materia5: json["materia5"],
        nombre: json["nombre"],
        online: json["online"],
        valor: json["valor"],
        tutor: json["tutor"],
        disponible: json["disponible"],
        titulo: json["titulo"],
      );

  Map<String, dynamic> toJson() => {
        "localIdB": localIdB,
        // "id"         : id,
        "apellido": apellido,
        "cedula": cedula,
        "celular": celular,
        "descripcion": descripcion,
        "email": email,
        "estrellas": estrellas / 1.0,
        "fotoUrl": fotoUrl,
        "lat": lat,
        "lon": lon,
        // "materias": List<dynamic>.from(materias.map((x) => x)),
        "materia1": materia1,
        "materia2": materia2,
        "materia3": materia3,
        "materia4": materia4,
        "materia5": materia5,
        "nombre": nombre,
        "online": online,
        "valor": valor,
        "tutor": tutor,
        "disponible": disponible,
        "titulo": titulo,
      };
}
