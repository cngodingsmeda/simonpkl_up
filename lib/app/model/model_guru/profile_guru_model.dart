// To parse this JSON data, do
//
//     final profileGuruModel = profileGuruModelFromJson(jsonString);

import 'dart:convert';

ProfileGuruModel profileGuruModelFromJson(String str) => ProfileGuruModel.fromJson(json.decode(str));

String profileGuruModelToJson(ProfileGuruModel data) => json.encode(data.toJson());

class ProfileGuruModel {
    int? id;
    String? nip;
    String? nama;
    String? noTelepon;
    String? email;
    String? jenisKelamin;
    String? tempatLahir;
    DateTime? tanggalLahir;
    String? agama;
    dynamic fotoProfile;
    dynamic tokenFcm;
    int? idSekolah;
    int? idTahun;
    Alamat? alamat;
    Sekolah? sekolah;

    ProfileGuruModel({
        this.id,
        this.nip,
        this.nama,
        this.noTelepon,
        this.email,
        this.jenisKelamin,
        this.tempatLahir,
        this.tanggalLahir,
        this.agama,
        this.fotoProfile,
        this.tokenFcm,
        this.idSekolah,
        this.idTahun,
        this.alamat,
        this.sekolah,
    });

    factory ProfileGuruModel.fromJson(Map<String, dynamic> json) => ProfileGuruModel(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        agama: json["agama"],
        fotoProfile: json["foto_profile"],
        tokenFcm: json["token_FCM"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        sekolah: json["sekolah"] == null ? null : Sekolah.fromJson(json["sekolah"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
        "no_telepon": noTelepon,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "foto_profile": fotoProfile,
        "token_FCM": tokenFcm,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
        "alamat": alamat?.toJson(),
        "sekolah": sekolah?.toJson(),
    };
}

class Alamat {
    String? detailTempat;
    String? desa;
    String? kecamatan;
    String? kabupaten;
    String? provinsi;
    String? negara;

    Alamat({
        this.detailTempat,
        this.desa,
        this.kecamatan,
        this.kabupaten,
        this.provinsi,
        this.negara,
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

class Sekolah {
    int? id;
    String? npsn;
    String? nama;
    dynamic logo;

    Sekolah({
        this.id,
        this.npsn,
        this.nama,
        this.logo,
    });

    factory Sekolah.fromJson(Map<String, dynamic> json) => Sekolah(
        id: json["id"],
        npsn: json["npsn"],
        nama: json["nama"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "npsn": npsn,
        "nama": nama,
        "logo": logo,
    };
}
