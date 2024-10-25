// To parse this JSON data, do
//
//     final jadwalAbsenSiswa = jadwalAbsenSiswaFromJson(jsonString);

import 'dart:convert';

JadwalAbsenSiswa jadwalAbsenSiswaFromJson(String str) => JadwalAbsenSiswa.fromJson(json.decode(str));

String jadwalAbsenSiswaToJson(JadwalAbsenSiswa data) => json.encode(data.toJson());

class JadwalAbsenSiswa {
    String? msg;
    List<Datum>? data;

    JadwalAbsenSiswa({
        this.msg,
        this.data,
    });

    factory JadwalAbsenSiswa.fromJson(Map<String, dynamic> json) => JadwalAbsenSiswa(
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
    String? hari;
    String? batasAbsenMasuk;
    String? batasAbsenPulang;
    bool? enable;
    Dudi? dudi;

    Datum({
        this.id,
        this.hari,
        this.batasAbsenMasuk,
        this.batasAbsenPulang,
        this.enable,
        this.dudi,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hari: json["hari"],
        batasAbsenMasuk: json["batas_absen_masuk"],
        batasAbsenPulang: json["batas_absen_pulang"],
        enable: json["enable"],
        dudi: json["dudi"] == null ? null : Dudi.fromJson(json["dudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "batas_absen_masuk": batasAbsenMasuk,
        "batas_absen_pulang": batasAbsenPulang,
        "enable": enable,
        "dudi": dudi?.toJson(),
    };
}

class Dudi {
    int? id;
    String? namaInstansiPerusahaan;
    String? bidangUsaha;
    String? noTelepon;
    String? deskripsi;
    bool? tersedia;
    int? idSekolah;
    int? idTahun;

    Dudi({
        this.id,
        this.namaInstansiPerusahaan,
        this.bidangUsaha,
        this.noTelepon,
        this.deskripsi,
        this.tersedia,
        this.idSekolah,
        this.idTahun,
    });

    factory Dudi.fromJson(Map<String, dynamic> json) => Dudi(
        id: json["id"],
        namaInstansiPerusahaan: json["nama_instansi_perusahaan"],
        bidangUsaha: json["bidang_usaha"],
        noTelepon: json["no_telepon"],
        deskripsi: json["deskripsi"],
        tersedia: json["tersedia"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_instansi_perusahaan": namaInstansiPerusahaan,
        "bidang_usaha": bidangUsaha,
        "no_telepon": noTelepon,
        "deskripsi": deskripsi,
        "tersedia": tersedia,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
    };
}
