// To parse this JSON data, do
//
//     final detilAjuanSiswaDudiModel = detilAjuanSiswaDudiModelFromJson(jsonString);

import 'dart:convert';

DetilAjuanSiswaDudiModel detilAjuanSiswaDudiModelFromJson(String str) => DetilAjuanSiswaDudiModel.fromJson(json.decode(str));

String detilAjuanSiswaDudiModelToJson(DetilAjuanSiswaDudiModel data) => json.encode(data.toJson());

class DetilAjuanSiswaDudiModel {
    Data? data;

    DetilAjuanSiswaDudiModel({
        this.data,
    });

    factory DetilAjuanSiswaDudiModel.fromJson(Map<String, dynamic> json) => DetilAjuanSiswaDudiModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? status;
    DateTime? waktuPengajuan;
    dynamic alasanPembatalan;
    Siswa? siswa;

    Data({
        this.id,
        this.status,
        this.waktuPengajuan,
        this.alasanPembatalan,
        this.siswa,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        status: json["status"],
        waktuPengajuan: json["waktu_pengajuan"] == null ? null : DateTime.parse(json["waktu_pengajuan"]),
        alasanPembatalan: json["alasan_pembatalan"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "waktu_pengajuan": waktuPengajuan?.toIso8601String(),
        "alasan_pembatalan": alasanPembatalan,
        "siswa": siswa?.toJson(),
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
    String? fotoProfile;

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
