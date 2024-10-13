// To parse this JSON data, do
//
//     final detilLaporanHarianSiswa = detilLaporanHarianSiswaFromJson(jsonString);

import 'dart:convert';

DetilLaporanHarianSiswa detilLaporanHarianSiswaFromJson(String str) => DetilLaporanHarianSiswa.fromJson(json.decode(str));

String detilLaporanHarianSiswaToJson(DetilLaporanHarianSiswa data) => json.encode(data.toJson());

class DetilLaporanHarianSiswa {
    int? id;
    String? topikPekerjaan;
    DateTime? tanggal;
    String? rujukanKompetensiDasar;
    String? dokumentasi;

    DetilLaporanHarianSiswa({
        this.id,
        this.topikPekerjaan,
        this.tanggal,
        this.rujukanKompetensiDasar,
        this.dokumentasi,
    });

    factory DetilLaporanHarianSiswa.fromJson(Map<String, dynamic> json) => DetilLaporanHarianSiswa(
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
