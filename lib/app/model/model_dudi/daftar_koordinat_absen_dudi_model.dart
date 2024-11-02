// To parse this JSON data, do
//
//     final daftarKoordinatAbsenDudiModel = daftarKoordinatAbsenDudiModelFromJson(jsonString);

import 'dart:convert';

DaftarKoordinatAbsenDudiModel daftarKoordinatAbsenDudiModelFromJson(String str) => DaftarKoordinatAbsenDudiModel.fromJson(json.decode(str));

String daftarKoordinatAbsenDudiModelToJson(DaftarKoordinatAbsenDudiModel data) => json.encode(data.toJson());

class DaftarKoordinatAbsenDudiModel {
    String? msg;
    List<Datum>? data;

    DaftarKoordinatAbsenDudiModel({
        this.msg,
        this.data,
    });

    factory DaftarKoordinatAbsenDudiModel.fromJson(Map<String, dynamic> json) => DaftarKoordinatAbsenDudiModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? namaTempat;
    double? latitude;
    double? longitude;
    int? radiusAbsenMeter;

    Datum({
        this.id,
        this.namaTempat,
        this.latitude,
        this.longitude,
        this.radiusAbsenMeter,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
