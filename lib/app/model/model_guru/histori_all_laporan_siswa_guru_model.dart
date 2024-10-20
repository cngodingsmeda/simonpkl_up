import 'dart:convert';

// Fungsi untuk mengonversi JSON string ke model
HistoriAllLaporanHarianSiswaGuruModel historiAllLaporanHarianSiswaGuruModelFromJson(String str) =>
    HistoriAllLaporanHarianSiswaGuruModel.fromJson(json.decode(str));

// Fungsi untuk mengonversi model ke JSON string
String historiAllLaporanHarianSiswaGuruModelToJson(HistoriAllLaporanHarianSiswaGuruModel data) =>
    json.encode(data.toJson());

class HistoriAllLaporanHarianSiswaGuruModel {
  String? msg;
  Map<String, List<LaporanData>>? data;

  HistoriAllLaporanHarianSiswaGuruModel({
    this.msg,
    this.data,
  });

  factory HistoriAllLaporanHarianSiswaGuruModel.fromJson(Map<String, dynamic> json) =>
      HistoriAllLaporanHarianSiswaGuruModel(
        msg: json["msg"],
        data: Map.from(json["data"]!).map((k, v) => MapEntry<String, List<LaporanData>>(
            k,
            List<LaporanData>.from(v.map((x) => LaporanData.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": Map.from(data!).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class LaporanData {
  int? id;
  String? topikPekerjaan; // Mengganti nama atribut
  String? rujukanKompetensiDasar; // Mengganti nama atribut
  String? dokumentasi; // Menambahkan atribut
  Siswa? siswa;
  Dudi? dudi;

  LaporanData({
    this.id,
    this.topikPekerjaan,
    this.rujukanKompetensiDasar,
    this.dokumentasi,
    this.siswa,
    this.dudi,
  });

  factory LaporanData.fromJson(Map<String, dynamic> json) => LaporanData(
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
