// To parse this JSON data, do
//
//     final laporanHarianSiswa = laporanHarianSiswaFromJson(jsonString);

import 'dart:convert';

LaporanHarianSiswa laporanHarianSiswaFromJson(String str) => LaporanHarianSiswa.fromJson(json.decode(str));

String laporanHarianSiswaToJson(LaporanHarianSiswa data) => json.encode(data.toJson());

class LaporanHarianSiswa {
    List<Datum>? data;

    LaporanHarianSiswa({
        this.data,
    });

    factory LaporanHarianSiswa.fromJson(Map<String, dynamic> json) => LaporanHarianSiswa(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? topikPekerjaan;
    DateTime? tanggal;
    String? rujukanKompetensiDasar;
    String? dokumentasi;

    Datum({
        this.id,
        this.topikPekerjaan,
        this.tanggal,
        this.rujukanKompetensiDasar,
        this.dokumentasi,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        topikPekerjaan: json["topik_pekerjaan"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        rujukanKompetensiDasar: json["rujukan_kompetensi_dasar"],
        dokumentasi: json["dokumentasi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "topik_pekerjaan": topikPekerjaan,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "rujukan_kompetensi_dasar": rujukanKompetensiDasar,
        "dokumentasi": dokumentasi,
    };
}
