// To parse this JSON data, do
//
//     final laporanHarianDudiModel = laporanHarianDudiModelFromJson(jsonString);

import 'dart:convert';

LaporanHarianDudiModel laporanHarianDudiModelFromJson(String str) => LaporanHarianDudiModel.fromJson(json.decode(str));

String laporanHarianDudiModelToJson(LaporanHarianDudiModel data) => json.encode(data.toJson());

class LaporanHarianDudiModel {
    String? msg;
    List<Datum>? data;

    LaporanHarianDudiModel({
        this.msg,
        this.data,
    });

    factory LaporanHarianDudiModel.fromJson(Map<String, dynamic> json) => LaporanHarianDudiModel(
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
    DateTime? tanggal;
    String? topikPekerjaan;
    String? rujukanKompetensiDasar;
    String? fileLaporan;
    Dudi? dudi;
    PembimbingDudi? pembimbingDudi;

    Datum({
        this.id,
        this.tanggal,
        this.topikPekerjaan,
        this.rujukanKompetensiDasar,
        this.fileLaporan,
        this.dudi,
        this.pembimbingDudi,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        topikPekerjaan: json["topik_pekerjaan"],
        rujukanKompetensiDasar: json["rujukan_kompetensi_dasar"],
        fileLaporan: json["file_laporan"],
        dudi: json["dudi"] == null ? null : Dudi.fromJson(json["dudi"]),
        pembimbingDudi: json["pembimbing_dudi"] == null ? null : PembimbingDudi.fromJson(json["pembimbing_dudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "topik_pekerjaan": topikPekerjaan,
        "rujukan_kompetensi_dasar": rujukanKompetensiDasar,
        "file_laporan": fileLaporan,
        "dudi": dudi?.toJson(),
        "pembimbing_dudi": pembimbingDudi?.toJson(),
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

class PembimbingDudi {
    int? id;
    String? username;
    String? nama;
    String? noTelepon;
    String? email;
    dynamic fotoProfile;
    String? jenisKelamin;
    dynamic tokenFcm;
    int? idDudi;
    int? idSekolah;
    int? idTahun;

    PembimbingDudi({
        this.id,
        this.username,
        this.nama,
        this.noTelepon,
        this.email,
        this.fotoProfile,
        this.jenisKelamin,
        this.tokenFcm,
        this.idDudi,
        this.idSekolah,
        this.idTahun,
    });

    factory PembimbingDudi.fromJson(Map<String, dynamic> json) => PembimbingDudi(
        id: json["id"],
        username: json["username"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        fotoProfile: json["foto_profile"],
        jenisKelamin: json["jenis_kelamin"],
        tokenFcm: json["token_FCM"],
        idDudi: json["id_dudi"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama": nama,
        "no_telepon": noTelepon,
        "email": email,
        "foto_profile": fotoProfile,
        "jenis_kelamin": jenisKelamin,
        "token_FCM": tokenFcm,
        "id_dudi": idDudi,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
    };
}
