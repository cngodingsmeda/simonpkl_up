// To parse this JSON data, do
//
//     final jadwalAbsenSiswa = jadwalAbsenSiswaFromJson(jsonString);

import 'dart:convert';

JadwalAbsenSiswa jadwalAbsenSiswaFromJson(String str) => JadwalAbsenSiswa.fromJson(json.decode(str));

String jadwalAbsenSiswaToJson(JadwalAbsenSiswa data) => json.encode(data.toJson());

class JadwalAbsenSiswa {
    List<Datum>? data;

    JadwalAbsenSiswa({
        this.data,
    });

    factory JadwalAbsenSiswa.fromJson(Map<String, dynamic> json) => JadwalAbsenSiswa(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? idDudi;
    DateTime? tanggalMulai;
    DateTime? tanggalBerakhir;
    List<Hari>? hari;

    Datum({
        this.id,
        this.idDudi,
        this.tanggalMulai,
        this.tanggalBerakhir,
        this.hari,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idDudi: json["id_dudi"],
        tanggalMulai: json["tanggal_mulai"] == null ? null : DateTime.parse(json["tanggal_mulai"]),
        tanggalBerakhir: json["tanggal_berakhir"] == null ? null : DateTime.parse(json["tanggal_berakhir"]),
        hari: json["hari"] == null ? [] : List<Hari>.from(json["hari"]!.map((x) => Hari.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_dudi": idDudi,
        "tanggal_mulai": "${tanggalMulai!.year.toString().padLeft(4, '0')}-${tanggalMulai!.month.toString().padLeft(2, '0')}-${tanggalMulai!.day.toString().padLeft(2, '0')}",
        "tanggal_berakhir": "${tanggalBerakhir!.year.toString().padLeft(4, '0')}-${tanggalBerakhir!.month.toString().padLeft(2, '0')}-${tanggalBerakhir!.day.toString().padLeft(2, '0')}",
        "hari": hari == null ? [] : List<dynamic>.from(hari!.map((x) => x.toJson())),
    };
}

class Hari {
    int? id;
    String? hari;
    String? batasAbsenMasuk;
    String? batasAbsenPulang;

    Hari({
        this.id,
        this.hari,
        this.batasAbsenMasuk,
        this.batasAbsenPulang,
    });

    factory Hari.fromJson(Map<String, dynamic> json) => Hari(
        id: json["id"],
        hari: json["hari"],
        batasAbsenMasuk: json["batas_absen_masuk"],
        batasAbsenPulang: json["batas_absen_pulang"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "batas_absen_masuk": batasAbsenMasuk,
        "batas_absen_pulang": batasAbsenPulang,
    };
}
