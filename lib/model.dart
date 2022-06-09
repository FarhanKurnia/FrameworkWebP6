import 'dart:convert';
import 'homepage.dart';

import 'package:flutter/material.dart';
List<Model> modelFromJson(String str) => List<Model>.from(json.decode(str).map((x) => Model.fromMap(x)));


class Model {
  Model({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
  });
// class Model {
//   final List<String> id;
//   final List<String> doa;
//   final List<String> ayat;
//   final List<String> latin;
//   final List<String> artinya;


  // final String id;
  // final String doa;
  // final String ayat;
  // final String latin;
  // final String artinya;

  // Model({
  //   required this.id,
  //   required this.doa,
  //   required this.ayat,
  //   required this.latin,
  //   required this.artinya,
  // });

  String id;
  String doa;
  String ayat;
  String latin;
  String artinya;

  // factory Model.fromJson(Map<String, dynamic> json) {
  //   var idFromJson  = json['id'];
  //   var doaFromJson  = json['doa'];
  //   var ayatFromJson  = json['ayat'];
  //   var latinFromJson  = json['latin'];
  //   var artinyaFromJson  = json['artinya'];
  //   List<String> idList = idFromJson.cast<String>();
  //   List<String> doaList = doaFromJson.cast<String>();
  //   List<String> ayatList = ayatFromJson.cast<String>();
  //   List<String> latinList = latinFromJson.cast<String>();
  //   List<String> artinyaList = artinyaFromJson.cast<String>();
  //
  //   return new Model(
  //     id: idList,
  //     doa: doaList,
  //     ayat: ayatList,
  //     latin: latinList,
  //     artinya: artinyaList,
  //   );


    // return Model(
    //   id: json["id"],
    //   doa: json["doa"],
    //   ayat: json["ayat"],
    //   latin: json["latin"],
    //   artinya: json["artinya"],
    // );

    factory Model.fromMap(Map<String, dynamic> json) =>
        Model(
          id: json["id"],
          doa: json["doa"],
          ayat: json["ayat"],
          latin: json["latin"],
          artinya: json["artinya"],
        );
}