import 'dart:convert';

// Fungsi untuk mengonversi JSON string ke model
HistoriAllLaporanDudiGuruModel historiAllLaporanDudiGuruModelFromJson(String str) =>
    HistoriAllLaporanDudiGuruModel.fromJson(json.decode(str));

// Fungsi untuk mengonversi model ke JSON string
String historiAllLaporanDudiGuruModelToJson(HistoriAllLaporanDudiGuruModel data) =>
    json.encode(data.toJson());

class HistoriAllLaporanDudiGuruModel {
  String? msg;
  Map<String, List<LaporanDudiData>>? data;

  HistoriAllLaporanDudiGuruModel({
    this.msg,
    this.data,
  });

  factory HistoriAllLaporanDudiGuruModel.fromJson(Map<String, dynamic> json) =>
      HistoriAllLaporanDudiGuruModel(
        msg: json["msg"],
        data: json["data"] != null
            ? Map.from(json["data"]).map((k, v) => MapEntry<String, List<LaporanDudiData>>(
                k,
                List<LaporanDudiData>.from(v.map((x) => LaporanDudiData.fromJson(x)))))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data != null
            ? Map.from(data!).map((k, v) =>
                MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson()))))
            : null,
      };
}

class LaporanDudiData {
  int? id;
  DateTime? tanggal;
  String? topikPekerjaan;
  String? rujukanKompetensiDasar;
  String? fileLaporan;
  Dudi? dudi;
  PembimbingDudi? pembimbingDudi;

  LaporanDudiData({
    this.id,
    this.tanggal,
    this.topikPekerjaan,
    this.rujukanKompetensiDasar,
    this.fileLaporan,
    this.dudi,
    this.pembimbingDudi,
  });

  factory LaporanDudiData.fromJson(Map<String, dynamic> json) => LaporanDudiData(
        id: json["id"],
        tanggal: json["tanggal"] != null ? DateTime.parse(json["tanggal"]) : null,
        topikPekerjaan: json["topik_pekerjaan"],
        rujukanKompetensiDasar: json["rujukan_kompetensi_dasar"],
        fileLaporan: json["file_laporan"],
        dudi: json["dudi"] != null ? Dudi.fromJson(json["dudi"]) : null,
        pembimbingDudi: json["pembimbing_dudi"] != null
            ? PembimbingDudi.fromJson(json["pembimbing_dudi"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": tanggal?.toIso8601String(),
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
  String? fotoProfile;
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
