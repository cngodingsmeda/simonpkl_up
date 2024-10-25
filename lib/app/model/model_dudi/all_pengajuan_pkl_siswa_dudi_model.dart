// To parse this JSON data, do
//
//     final allPengajuanPklSiswaDudiModel = allPengajuanPklSiswaDudiModelFromJson(jsonString);

import 'dart:convert';

AllPengajuanPklSiswaDudiModel allPengajuanPklSiswaDudiModelFromJson(
        String str) =>
    AllPengajuanPklSiswaDudiModel.fromJson(json.decode(str));

String allPengajuanPklSiswaDudiModelToJson(
        AllPengajuanPklSiswaDudiModel data) =>
    json.encode(data.toJson());

class AllPengajuanPklSiswaDudiModel {
  List<Datum>? data;

  AllPengajuanPklSiswaDudiModel({
    this.data,
  });

  factory AllPengajuanPklSiswaDudiModel.fromJson(Map<String, dynamic> json) =>
      AllPengajuanPklSiswaDudiModel(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? status;
  DateTime? waktuPengajuan;
  String? alasanPembatalan;
  Siswa? siswa;

  Datum({
    this.id,
    this.status,
    this.waktuPengajuan,
    this.alasanPembatalan,
    this.siswa,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        waktuPengajuan: json["waktu_pengajuan"] == null
            ? null
            : DateTime.parse(json["waktu_pengajuan"]),
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
  Alamat? alamat;
  Jurusan? jurusan;
  Kelas? kelas;

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
    this.alamat,
    this.jurusan,
    this.kelas,
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
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        jurusan:
            json["jurusan"] == null ? null : Jurusan.fromJson(json["jurusan"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
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
        "alamat": alamat?.toJson(),
        "jurusan": jurusan?.toJson(),
        "kelas": kelas?.toJson(),
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

class Kelas {
  int? id;
  String? nama;
  String? tahun;
  int? idJurusan;

  Kelas({
    this.id,
    this.nama,
    this.tahun,
    this.idJurusan,
  });

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        nama: json["nama"],
        tahun: json["tahun"],
        idJurusan: json["id_jurusan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "tahun": tahun,
        "id_jurusan": idJurusan,
      };
}
