import 'dart:convert';

List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromMap(x)));

// Kelas digunakan untuk mendefinisikan konstruktor dari model
class Model {
  Model({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });

// Varibel ini mendefinisikan atribut dari data JSON yang akan dihit endpoint nya melalui API
  String id;
  String doa;
  String ayat;
  String latin;
  String artinya;

// Fungsi ini akan melakukan MAP model dari model json
  factory Model.fromMap(Map<String, dynamic> json) =>
      Model(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
      );
}