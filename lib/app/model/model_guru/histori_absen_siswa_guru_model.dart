import 'dart:convert';

// Fungsi untuk mengonversi JSON string ke model
HistoriAbsenSiswaGuruModel historiAbsenSiswaGuruModelFromJson(String str) =>
    HistoriAbsenSiswaGuruModel.fromJson(json.decode(str));

// Fungsi untuk mengonversi model ke JSON string
String historiAbsenSiswaGuruModelToJson(HistoriAbsenSiswaGuruModel data) =>
    json.encode(data.toJson());

class HistoriAbsenSiswaGuruModel {
  List<Datum>? data;

  HistoriAbsenSiswaGuruModel({this.data});

  // Parsing JSON ke Model dengan handling data sebagai List atau Map
  factory HistoriAbsenSiswaGuruModel.fromJson(Map<String, dynamic> json) {
    final dynamic dataField = json["data"];

    return HistoriAbsenSiswaGuruModel(
      // Cek apakah data berupa List; jika tidak, return list kosong.
      data: (dataField is List<dynamic>)
          ? dataField.map((x) => Datum.fromJson(x)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  int? idAbsenJadwal;
  int? idSiswa;
  String? tanggal;
  String? absenMasuk;
  String? absenPulang;
  String? statusAbsenMasuk;
  String? statusAbsenPulang;
  String? fotoAbsenMasuk;
  String? fotoAbsenPulang;
  String? status;
  Siswa? siswa;

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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idAbsenJadwal: json["id_absen_jadwal"],
        idSiswa: json["id_siswa"],
        tanggal: json["tanggal"],
        absenMasuk: json["absen_masuk"],
        absenPulang: json["absen_pulang"],
        statusAbsenMasuk: json["status_absen_masuk"],
        statusAbsenPulang: json["status_absen_pulang"],
        fotoAbsenMasuk: json["foto_absen_masuk"],
        fotoAbsenPulang: json["foto_absen_pulang"],
        status: json["status"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_absen_jadwal": idAbsenJadwal,
        "id_siswa": idSiswa,
        "tanggal": tanggal,
        "absen_masuk": absenMasuk,
        "absen_pulang": absenPulang,
        "status_absen_masuk": statusAbsenMasuk,
        "status_absen_pulang": statusAbsenPulang,
        "foto_absen_masuk": fotoAbsenMasuk,
        "foto_absen_pulang": fotoAbsenPulang,
        "status": status,
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
  Dudi? dudi;

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
    this.dudi,
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
        dudi: json["dudi"] == null ? null : Dudi.fromJson(json["dudi"]),
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
