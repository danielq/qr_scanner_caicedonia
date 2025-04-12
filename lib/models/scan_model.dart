// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

ScanModel scanModelFromMap(String str) => ScanModel.fromMap(json.decode(str));

String scanModelToMap(ScanModel data) => json.encode(data.toMap());

class ScanModel {
  int id;
  String tipo;
  String valor;

  ScanModel({
    required this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (tipo.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
