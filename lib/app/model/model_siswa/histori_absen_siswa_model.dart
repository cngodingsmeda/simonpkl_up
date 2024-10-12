// To parse this JSON data, do
//
//     final historiAbsenModel = historiAbsenModelFromJson(jsonString);

import 'dart:convert';

HistoriAbsenModel historiAbsenModelFromJson(String str) => HistoriAbsenModel.fromJson(json.decode(str));

String historiAbsenModelToJson(HistoriAbsenModel data) => json.encode(data.toJson());

class HistoriAbsenModel {
    List<Datum>? data;

    HistoriAbsenModel({
        this.data,
    });

    factory HistoriAbsenModel.fromJson(Map<String, dynamic> json) => HistoriAbsenModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    int? idAbsenJadwal;
    int? idSiswa;
    DateTime? tanggal;
    String? absenMasuk;
    dynamic absenPulang;
    String? statusAbsenMasuk;
    dynamic statusAbsenPulang;
    String? fotoAbsenMasuk;
    dynamic fotoAbsenPulang;
    String? status;
    Siswa? siswa;
    KeteranganAbsen? keteranganAbsenMasuk;
    KeteranganAbsen? keteranganAbsenPulang;

    Datum({
        this.id,
        this.idAbsenJadwal,
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
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idAbsenJadwal: json["id_absen_jadwal"],
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
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_absen_jadwal": idAbsenJadwal,
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
    };
}

class KeteranganAbsen {
    int? id;
    String? note;
    String? statusIzin;

    KeteranganAbsen({
        this.id,
        this.note,
        this.statusIzin,
    });

    factory KeteranganAbsen.fromJson(Map<String, dynamic> json) => KeteranganAbsen(
        id: json["id"],
        note: json["note"],
        statusIzin: json["status_izin"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "status_izin": statusIzin,
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
