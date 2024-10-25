// To parse this JSON data, do
//
//     final detilHistoriAbsenSiswaDudiModel = detilHistoriAbsenSiswaDudiModelFromJson(jsonString);

import 'dart:convert';

DetilHistoriAbsenSiswaDudiModel detilHistoriAbsenSiswaDudiModelFromJson(String str) => DetilHistoriAbsenSiswaDudiModel.fromJson(json.decode(str));

String detilHistoriAbsenSiswaDudiModelToJson(DetilHistoriAbsenSiswaDudiModel data) => json.encode(data.toJson());

class DetilHistoriAbsenSiswaDudiModel {
    String? msg;
    Data? data;

    DetilHistoriAbsenSiswaDudiModel({
        this.msg,
        this.data,
    });

    factory DetilHistoriAbsenSiswaDudiModel.fromJson(Map<String, dynamic> json) => DetilHistoriAbsenSiswaDudiModel(
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
    int? idSiswa;
    DateTime? tanggal;
    String? absenMasuk;
    String? absenPulang;
    String? statusAbsenMasuk;
    String? statusAbsenPulang;
    String? fotoAbsenMasuk;
    String? fotoAbsenPulang;
    String? status;
    Siswa? siswa;
    KeteranganAbsen? keteranganAbsenMasuk;
    KeteranganAbsen? keteranganAbsenPulang;
    dynamic dokumenSakit;

    Data({
        this.id,
        this.idSiswa,
        this.tanggal,
        this.absenMasuk,
        this.absenPulang,
        this.statusAbsenMasuk,
        this.statusAbsenPulang,
        this.fotoAbsenMasuk,
        this.fotoAbsenPulang,
        this.status,
        this.siswa,
        this.keteranganAbsenMasuk,
        this.keteranganAbsenPulang,
        this.dokumenSakit,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idSiswa: json["id_siswa"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        absenMasuk: json["absen_masuk"],
        absenPulang: json["absen_pulang"],
        statusAbsenMasuk: json["status_absen_masuk"],
        statusAbsenPulang: json["status_absen_pulang"],
        fotoAbsenMasuk: json["foto_absen_masuk"],
        fotoAbsenPulang: json["foto_absen_pulang"],
        status: json["status"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
        keteranganAbsenMasuk: json["keterangan_absen_masuk"] == null ? null : KeteranganAbsen.fromJson(json["keterangan_absen_masuk"]),
        keteranganAbsenPulang: json["keterangan_absen_pulang"] == null ? null : KeteranganAbsen.fromJson(json["keterangan_absen_pulang"]),
        dokumenSakit: json["dokumenSakit"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_siswa": idSiswa,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "absen_masuk": absenMasuk,
        "absen_pulang": absenPulang,
        "status_absen_masuk": statusAbsenMasuk,
        "status_absen_pulang": statusAbsenPulang,
        "foto_absen_masuk": fotoAbsenMasuk,
        "foto_absen_pulang": fotoAbsenPulang,
        "status": status,
        "siswa": siswa?.toJson(),
        "keterangan_absen_masuk": keteranganAbsenMasuk?.toJson(),
        "keterangan_absen_pulang": keteranganAbsenPulang?.toJson(),
        "dokumenSakit": dokumenSakit,
    };
}

class KeteranganAbsen {
    int? id;
    String? note;
    String? statusIzin;
    bool? insideRadius;

    KeteranganAbsen({
        this.id,
        this.note,
        this.statusIzin,
        this.insideRadius,
    });

    factory KeteranganAbsen.fromJson(Map<String, dynamic> json) => KeteranganAbsen(
        id: json["id"],
        note: json["note"],
        statusIzin: json["status_izin"],
        insideRadius: json["inside_radius"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "status_izin": statusIzin,
        "inside_radius": insideRadius,
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
