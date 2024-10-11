import 'dart:convert';

ProfileSiswaModel? profileSiswaModelFromJson(String str) =>
    ProfileSiswaModel.fromJson(json.decode(str));

String profileSiswaModelToJson(ProfileSiswaModel? data) =>
    json.encode(data?.toJson());

class ProfileSiswaModel {
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
  GuruPembimbing? guruPembimbing;
  Dudi? dudi;
  PembimbingDudi? pembimbingDudi;

  ProfileSiswaModel({
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
    this.guruPembimbing,
    this.dudi,
    this.pembimbingDudi,
  });

  factory ProfileSiswaModel.fromJson(Map<String, dynamic> json) =>
      ProfileSiswaModel(
        id: json["id"],
        nis: json["nis"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        status: json["status"],
        tokenFcm: json["token_FCM"],
        fotoProfile: json["foto_profile"],
        alamat: json["alamat"] != null ? Alamat.fromJson(json["alamat"]) : null,
        jurusan:
            json["jurusan"] != null ? Jurusan.fromJson(json["jurusan"]) : null,
        kelas: json["kelas"] != null ? Kelas.fromJson(json["kelas"]) : null,
        guruPembimbing: json["guru_pembimbing"] != null
            ? GuruPembimbing.fromJson(json["guru_pembimbing"])
            : null,
        dudi: json["dudi"] != null ? Dudi.fromJson(json["dudi"]) : null,
        pembimbingDudi: json["pembimbing_dudi"] != null
            ? PembimbingDudi.fromJson(json["pembimbing_dudi"])
            : null,
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
        "guru_pembimbing": guruPembimbing?.toJson(),
        "dudi": dudi?.toJson(),
        "pembimbing_dudi": pembimbingDudi?.toJson(),
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

class Dudi {
  int? id;
  String? namaInstansiPerusahaan;
  String? bidangUsaha;
  String? noTelepon;
  String? deskripsi;
  bool? tersedia;
  int? idSekolah;
  int? idTahun;
  Alamat? alamat;

  Dudi({
    this.id,
    this.namaInstansiPerusahaan,
    this.bidangUsaha,
    this.noTelepon,
    this.deskripsi,
    this.tersedia,
    this.idSekolah,
    this.idTahun,
    this.alamat,
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
        alamat: json["alamat"] != null ? Alamat.fromJson(json["alamat"]) : null,
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
        "alamat": alamat?.toJson(),
      };
}

class GuruPembimbing {
  int id;
  String nip;
  String nama;
  String noTelepon;
  String email;
  String jenisKelamin;
  String tempatLahir;
  DateTime tanggalLahir;
  String agama;
  dynamic fotoProfile;
  dynamic tokenFcm;
  int idSekolah;
  int idTahun;

  GuruPembimbing({
    required this.id,
    required this.nip,
    required this.nama,
    required this.noTelepon,
    required this.email,
    required this.jenisKelamin,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.agama,
    required this.fotoProfile,
    required this.tokenFcm,
    required this.idSekolah,
    required this.idTahun,
  });

  factory GuruPembimbing.fromJson(Map<String, dynamic> json) => GuruPembimbing(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        agama: json["agama"],
        fotoProfile: json["foto_profile"],
        tokenFcm: json["token_FCM"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
        "no_telepon": noTelepon,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir":
            "${tanggalLahir.year.toString().padLeft(4, '0')}-${tanggalLahir.month.toString().padLeft(2, '0')}-${tanggalLahir.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "foto_profile": fotoProfile,
        "token_FCM": tokenFcm,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
      };
}

class Jurusan {
  int id;
  String nama;
  int idSekolah;
  int idTahun;

  Jurusan({
    required this.id,
    required this.nama,
    required this.idSekolah,
    required this.idTahun,
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
  int id;
  String nama;
  String tahun;
  int idJurusan;

  Kelas({
    required this.id,
    required this.nama,
    required this.tahun,
    required this.idJurusan,
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

class PembimbingDudi {
  int id;
  String username;
  String nama;
  String noTelepon;
  String email;
  dynamic fotoProfile;
  String jenisKelamin;
  dynamic tokenFcm;
  int idDudi;
  int idSekolah;
  int idTahun;

  PembimbingDudi({
    required this.id,
    required this.username,
    required this.nama,
    required this.noTelepon,
    required this.email,
    required this.fotoProfile,
    required this.jenisKelamin,
    required this.tokenFcm,
    required this.idDudi,
    required this.idSekolah,
    required this.idTahun,
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
