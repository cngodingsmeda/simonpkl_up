// To parse this JSON data, do
//
//     final laporanKendalaDudiModel = laporanKendalaDudiModelFromJson(jsonString);

import 'dart:convert';

LaporanKendalaDudiModel laporanKendalaDudiModelFromJson(String str) => LaporanKendalaDudiModel.fromJson(json.decode(str));

String laporanKendalaDudiModelToJson(LaporanKendalaDudiModel data) => json.encode(data.toJson());

class LaporanKendalaDudiModel {
    String? msg;
    List<Datum>? data;

    LaporanKendalaDudiModel({
        this.msg,
        this.data,
    });

    factory LaporanKendalaDudiModel.fromJson(Map<String, dynamic> json) => LaporanKendalaDudiModel(
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
    int? idSiswa;
    int? idPembimbingDudi;
    DateTime? tanggal;
    String? kendala;
    dynamic fileLaporan;
    String? deskripsi;

    Datum({
        this.id,
        this.idSiswa,
        this.idPembimbingDudi,
        this.tanggal,
        this.kendala,
        this.fileLaporan,
        this.deskripsi,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idSiswa: json["id_siswa"],
        idPembimbingDudi: json["id_pembimbing_dudi"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        kendala: json["kendala"],
        fileLaporan: json["file_laporan"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_siswa": idSiswa,
        "id_pembimbing_dudi": idPembimbingDudi,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "kendala": kendala,
        "file_laporan": fileLaporan,
        "deskripsi": deskripsi,
    };
}
