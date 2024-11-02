// To parse this JSON data, do
//
//     final koordinatAbsenDudiModel = koordinatAbsenDudiModelFromJson(jsonString);

import 'dart:convert';

KoordinatAbsenDudiModel koordinatAbsenDudiModelFromJson(String str) =>
    KoordinatAbsenDudiModel.fromJson(json.decode(str));

String koordinatAbsenDudiModelToJson(KoordinatAbsenDudiModel data) =>
    json.encode(data.toJson());

class KoordinatAbsenDudiModel {
  String? msg;
  Data? data;

  KoordinatAbsenDudiModel({
    this.msg,
    this.data,
  });

  factory KoordinatAbsenDudiModel.fromJson(Map<String, dynamic> json) =>
      KoordinatAbsenDudiModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? namaTempat;
  double? latitude;
  double? longitude;
  int? radiusAbsenMeter;

  Data({
    this.id,
    this.namaTempat,
    this.latitude,
    this.longitude,
    this.radiusAbsenMeter,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        namaTempat: json["nama_tempat"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        radiusAbsenMeter: json["radius_absen_meter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_tempat": namaTempat,
        "latitude": latitude,
        "longitude": longitude,
        "radius_absen_meter": radiusAbsenMeter,
      };
}
