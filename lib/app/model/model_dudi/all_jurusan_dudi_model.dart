// To parse this JSON data, do
//
//     final allJurusanDudiModel = allJurusanDudiModelFromJson(jsonString);

import 'dart:convert';

AllJurusanDudiModel allJurusanDudiModelFromJson(String str) => AllJurusanDudiModel.fromJson(json.decode(str));

String allJurusanDudiModelToJson(AllJurusanDudiModel data) => json.encode(data.toJson());

class AllJurusanDudiModel {
    String? msg;
    List<Datum>? data;

    AllJurusanDudiModel({
        this.msg,
        this.data,
    });

    factory AllJurusanDudiModel.fromJson(Map<String, dynamic> json) => AllJurusanDudiModel(
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
    String? nama;
    int? idSekolah;
    int? idTahun;

    Datum({
        this.id,
        this.nama,
        this.idSekolah,
        this.idTahun,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
    };
}
