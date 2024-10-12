// To parse this JSON data, do
//
//     final detilHistoriAbsenModel = detilHistoriAbsenModelFromJson(jsonString);

import 'dart:convert';

DetilHistoriAbsenModel detilHistoriAbsenModelFromJson(String str) =>
    DetilHistoriAbsenModel.fromJson(json.decode(str));

String detilHistoriAbsenModelToJson(DetilHistoriAbsenModel data) =>
    json.encode(data.toJson());

class DetilHistoriAbsenModel {
  int id;
  int idAbsenJadwal;
  int idSiswa;
  DateTime tanggal;
  String? absenMasuk;
  String? absenPulang;
  String? statusAbsenMasuk;
  String? statusAbsenPulang;
  String? fotoAbsenMasuk;
  String? fotoAbsenPulang;
  String status;
  Siswa siswa;
  KeteranganAbsen? keteranganAbsenMasuk;
  KeteranganAbsen? keteranganAbsenPulang;
  dynamic dokumenSakit;
  JadwalHari jadwalHari;

  DetilHistoriAbsenModel({
    required this.id,
    required this.idAbsenJadwal,
    required this.idSiswa,
    required this.tanggal,
    this.absenMasuk,
    this.absenPulang,
    this.statusAbsenMasuk,
    this.statusAbsenPulang,
    this.fotoAbsenMasuk,
    this.fotoAbsenPulang,
    required this.status,
    required this.siswa,
    this.keteranganAbsenMasuk,
    this.keteranganAbsenPulang,
    this.dokumenSakit,
    required this.jadwalHari,
  });

  factory DetilHistoriAbsenModel.fromJson(Map<String, dynamic> json) =>
      DetilHistoriAbsenModel(
        id: json["id"],
        idAbsenJadwal: json["id_absen_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal: DateTime.parse(json["tanggal"]),
        absenMasuk: json["absen_masuk"],
        absenPulang: json["absen_pulang"],
        statusAbsenMasuk: json["status_absen_masuk"],
        statusAbsenPulang: json["status_absen_pulang"],
        fotoAbsenMasuk: json["foto_absen_masuk"],
        fotoAbsenPulang: json["foto_absen_pulang"],
        status: json["status"],
        siswa: Siswa.fromJson(json["siswa"]),
        keteranganAbsenMasuk: json["keterangan_absen_masuk"] != null
            ? KeteranganAbsen.fromJson(json["keterangan_absen_masuk"])
            : null,
        keteranganAbsenPulang: json["keterangan_absen_pulang"] != null
            ? KeteranganAbsen.fromJson(json["keterangan_absen_pulang"])
            : null,
        dokumenSakit: json["dokumenSakit"],
        jadwalHari: JadwalHari.fromJson(json["jadwal_hari"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_absen_jadwal": idAbsenJadwal,
        "id_siswa": idSiswa,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "absen_masuk": absenMasuk,
        "absen_pulang": absenPulang,
        "status_absen_masuk": statusAbsenMasuk,
        "status_absen_pulang": statusAbsenPulang,
        "foto_absen_masuk": fotoAbsenMasuk,
        "foto_absen_pulang": fotoAbsenPulang,
        "status": status,
        "siswa": siswa.toJson(),
        "keterangan_absen_masuk": keteranganAbsenMasuk?.toJson(),
        "keterangan_absen_pulang": keteranganAbsenPulang?.toJson(),
        "dokumenSakit": dokumenSakit,
        "jadwal_hari": jadwalHari.toJson(),
      };
}

class JadwalHari {
  int id;
  String hari;
  String? batasAbsenMasuk;
  String? batasAbsenPulang;

  JadwalHari({
    required this.id,
    required this.hari,
    this.batasAbsenMasuk,
    this.batasAbsenPulang,
  });

  factory JadwalHari.fromJson(Map<String, dynamic> json) => JadwalHari(
        id: json["id"],
        hari: json["hari"],
        batasAbsenMasuk: json["batas_absen_masuk"],
        batasAbsenPulang: json["batas_absen_pulang"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "batas_absen_masuk": batasAbsenMasuk,
        "batas_absen_pulang": batasAbsenPulang,
      };
}

class KeteranganAbsen {
  int? id;
  String? note;
  bool? insideRadius;
  String? statusIzin;

  KeteranganAbsen({
    this.id,
    this.note,
    this.insideRadius,
    this.statusIzin,
  });

  factory KeteranganAbsen.fromJson(Map<String, dynamic> json) =>
      KeteranganAbsen(
        id: json["id"],
        note: json["note"],
        insideRadius: json["insideRadius"],
        statusIzin: json["status_izin"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "note": note,
        "insideRadius": insideRadius,
        "status_izin": statusIzin,
      };
}

class Siswa {
  int id;
  String nis;
  String nama;
  String jenisKelamin;
  String email;
  String noTelepon;
  String status;
  dynamic tokenFcm;
  String fotoProfile;
  Dudi dudi;

  Siswa({
    required this.id,
    required this.nis,
    required this.nama,
    required this.jenisKelamin,
    required this.email,
    required this.noTelepon,
    required this.status,
    this.tokenFcm,
    required this.fotoProfile,
    required this.dudi,
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
        dudi: Dudi.fromJson(json["dudi"]),
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

  Dudi({
    required this.id,
    required this.namaInstansiPerusahaan,
    required this.bidangUsaha,
    required this.noTelepon,
    required this.deskripsi,
    required this.tersedia,
    required this.idSekolah,
    required this.idTahun,
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
