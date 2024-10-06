// To parse this JSON data, do
//
//     final lastAjuanPklModel = lastAjuanPklModelFromJson(jsonString);

import 'dart:convert';

LastAjuanPklModel lastAjuanPklModelFromJson(String str) => LastAjuanPklModel.fromJson(json.decode(str));

String lastAjuanPklModelToJson(LastAjuanPklModel data) => json.encode(data.toJson());

class LastAjuanPklModel {
    int id;
    String status;
    DateTime waktuPengajuan;
    dynamic alasanPembatalan;
    Dudi dudi;

    LastAjuanPklModel({
        required this.id,
        required this.status,
        required this.waktuPengajuan,
        required this.alasanPembatalan,
        required this.dudi,
    });

    factory LastAjuanPklModel.fromJson(Map<String, dynamic> json) => LastAjuanPklModel(
        id: json["id"],
        status: json["status"],
        waktuPengajuan: DateTime.parse(json["waktu_pengajuan"]),
        alasanPembatalan: json["alasan_pembatalan"],
        dudi: Dudi.fromJson(json["dudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "waktu_pengajuan": waktuPengajuan.toIso8601String(),
        "alasan_pembatalan": alasanPembatalan,
        "dudi": dudi.toJson(),
    };
}

class Dudi {
    int id;
    String namaInstansiPerusahaan;
    String bidangUsaha;
    String noTelepon;
    String deskripsi;
    bool tersedia;
    int idSekolah;
    int idTahun;
    Alamat alamat;

    Dudi({
        required this.id,
        required this.namaInstansiPerusahaan,
        required this.bidangUsaha,
        required this.noTelepon,
        required this.deskripsi,
        required this.tersedia,
        required this.idSekolah,
        required this.idTahun,
        required this.alamat,
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
        alamat: Alamat.fromJson(json["alamat"]),
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
        "alamat": alamat.toJson(),
    };
}

class Alamat {
    String detailTempat;
    String desa;
    String kecamatan;
    String kabupaten;
    String provinsi;
    String negara;

    Alamat({
        required this.detailTempat,
        required this.desa,
        required this.kecamatan,
        required this.kabupaten,
        required this.provinsi,
        required this.negara,
    });

    factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        detailTempat: json["detail_tempat"],
        desa: json["desa"],
        kecamatan: json["kecamatan"],
        kabupaten: json["kabupaten"],
        provinsi: json["provinsi"],
        negara: json["negara"],
    );

    Map<String, dynamic> toJson() => {
        "detail_tempat": detailTempat,
        "desa": desa,
        "kecamatan": kecamatan,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "negara": negara,
    };
}