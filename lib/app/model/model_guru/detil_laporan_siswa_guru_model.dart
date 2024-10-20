// To parse this JSON data, do
//
//     final detilLaporanSiswaGuruModel = detilLaporanSiswaGuruModelFromJson(jsonString);

import 'dart:convert';

DetilLaporanSiswaGuruModel detilLaporanSiswaGuruModelFromJson(String str) => DetilLaporanSiswaGuruModel.fromJson(json.decode(str));

String detilLaporanSiswaGuruModelToJson(DetilLaporanSiswaGuruModel data) => json.encode(data.toJson());

class DetilLaporanSiswaGuruModel {
    Data? data;

    DetilLaporanSiswaGuruModel({
        this.data,
    });

    factory DetilLaporanSiswaGuruModel.fromJson(Map<String, dynamic> json) => DetilLaporanSiswaGuruModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? topikPekerjaan;
    String? rujukanKompetensiDasar;
    String? dokumentasi;
    Siswa? siswa;
    Dudi? dudi;

    Data({
        this.id,
        this.topikPekerjaan,
        this.rujukanKompetensiDasar,
        this.dokumentasi,
        this.siswa,
        this.dudi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        topikPekerjaan: json["topik_pekerjaan"],
        rujukanKompetensiDasar: json["rujukan_kompetensi_dasar"],
        dokumentasi: json["dokumentasi"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
        dudi: json["dudi"] == null ? null : Dudi.fromJson(json["dudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "topik_pekerjaan": topikPekerjaan,
        "rujukan_kompetensi_dasar": rujukanKompetensiDasar,
        "dokumentasi": dokumentasi,
        "siswa": siswa?.toJson(),
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

class Siswa {
    int? id;
    String? nis;
    String? nama;
    String? jenisKelamin;
    String? email;
    String? noTelepon;
    String? status;
    dynamic tokenFcm;
    dynamic fotoProfile;

    Siswa({
        this.id,
        this.nis,
        this.nama,
        this.jenisKelamin,
        this.email,
        this.noTelepon,
        this.status,
        this.tokenFcm,
        this.fotoProfile,
    });

    factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"],
        nis: json["nis"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        status: json["status"],
        tokenFcm: json["token_FCM"],
        fotoProfile: json["foto_profile"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nis": nis,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "email": email,
        "no_telepon": noTelepon,
        "status": status,
        "token_FCM": tokenFcm,
        "foto_profile": fotoProfile,
    };
}
