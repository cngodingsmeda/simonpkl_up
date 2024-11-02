// To parse this JSON data, do
//
//     final kuotaDudiModel = kuotaDudiModelFromJson(jsonString);

import 'dart:convert';

KuotaDudiModel kuotaDudiModelFromJson(String str) => KuotaDudiModel.fromJson(json.decode(str));

String kuotaDudiModelToJson(KuotaDudiModel data) => json.encode(data.toJson());

class KuotaDudiModel {
    String? msg;
    Data? data;

    KuotaDudiModel({
        this.msg,
        this.data,
    });

    factory KuotaDudiModel.fromJson(Map<String, dynamic> json) => KuotaDudiModel(
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
    String? namaInstansiPerusahaan;
    String? bidangUsaha;
    String? noTelepon;
    String? deskripsi;
    bool? tersedia;
    int? idSekolah;
    int? idTahun;
    Kuota? kuota;

    Data({
        this.id,
        this.namaInstansiPerusahaan,
        this.bidangUsaha,
        this.noTelepon,
        this.deskripsi,
        this.tersedia,
        this.idSekolah,
        this.idTahun,
        this.kuota,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        namaInstansiPerusahaan: json["nama_instansi_perusahaan"],
        bidangUsaha: json["bidang_usaha"],
        noTelepon: json["no_telepon"],
        deskripsi: json["deskripsi"],
        tersedia: json["tersedia"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
        kuota: json["kuota"] == null ? null : Kuota.fromJson(json["kuota"]),
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
        "kuota": kuota?.toJson(),
    };
}

class Kuota {
    int? id;
    int? jumlahPria;
    int? jumlahWanita;
    List<Kuota>? kuotaJurusan;
    Jurusan? jurusan;

    Kuota({
        this.id,
        this.jumlahPria,
        this.jumlahWanita,
        this.kuotaJurusan,
        this.jurusan,
    });

    factory Kuota.fromJson(Map<String, dynamic> json) => Kuota(
        id: json["id"],
        jumlahPria: json["jumlah_pria"],
        jumlahWanita: json["jumlah_wanita"],
        kuotaJurusan: json["kuota_jurusan"] == null ? [] : List<Kuota>.from(json["kuota_jurusan"]!.map((x) => Kuota.fromJson(x))),
        jurusan: json["jurusan"] == null ? null : Jurusan.fromJson(json["jurusan"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jumlah_pria": jumlahPria,
        "jumlah_wanita": jumlahWanita,
        "kuota_jurusan": kuotaJurusan == null ? [] : List<dynamic>.from(kuotaJurusan!.map((x) => x.toJson())),
        "jurusan": jurusan?.toJson(),
    };
}

class Jurusan {
    int? id;
    String? nama;
    int? idSekolah;
    int? idTahun;

    Jurusan({
        this.id,
        this.nama,
        this.idSekolah,
        this.idTahun,
    });

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
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
