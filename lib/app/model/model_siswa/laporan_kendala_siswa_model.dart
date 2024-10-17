// To parse this JSON data, do
//
//     final laporanKendalaSiswaModel = laporanKendalaSiswaModelFromJson(jsonString);

import 'dart:convert';

LaporanKendalaSiswaModel laporanKendalaSiswaModelFromJson(String str) => LaporanKendalaSiswaModel.fromJson(json.decode(str));

String laporanKendalaSiswaModelToJson(LaporanKendalaSiswaModel data) => json.encode(data.toJson());

class LaporanKendalaSiswaModel {
    List<Datum>? data;

    LaporanKendalaSiswaModel({
        this.data,
    });

    factory LaporanKendalaSiswaModel.fromJson(Map<String, dynamic> json) => LaporanKendalaSiswaModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    DateTime? tanggal;
    String? kendala;
    dynamic fileLaporan;
    String? deskripsi;

    Datum({
        this.id,
        this.tanggal,
        this.kendala,
        this.fileLaporan,
        this.deskripsi,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        kendala: json["kendala"],
        fileLaporan: json["file_laporan"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "kendala": kendala,
        "file_laporan": fileLaporan,
        "deskripsi": deskripsi,
    };
}
