class Datum {
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

  Datum({
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
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        keteranganAbsenMasuk: json["keterangan_absen_masuk"] == null
            ? null
            : KeteranganAbsen.fromJson(json["keterangan_absen_masuk"]),
        keteranganAbsenPulang: json["keterangan_absen_pulang"] == null
            ? null
            : KeteranganAbsen.fromJson(json["keterangan_absen_pulang"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_absen_jadwal": idAbsenJadwal,
        "id_siswa": idSiswa,
        "tanggal": tanggal.toIso8601String(),
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
      };
}

class KeteranganAbsen {
  int id;
  String? note;
  bool insideRadius;
  String? statusIzin;

  KeteranganAbsen({
    required this.id,
    this.note,
    required this.insideRadius,
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

  Siswa({
    required this.id,
    required this.nis,
    required this.nama,
    required this.jenisKelamin,
    required this.email,
    required this.noTelepon,
    required this.status,
    required this.tokenFcm,
    required this.fotoProfile,
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
