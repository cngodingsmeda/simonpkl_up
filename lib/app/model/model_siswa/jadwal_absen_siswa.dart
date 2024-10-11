import 'dart:convert';

JadwalAbsenSiswa jadwalAbsenSiswaFromJson(String str) =>
    JadwalAbsenSiswa.fromJson(json.decode(str));

String jadwalAbsenSiswaToJson(JadwalAbsenSiswa data) =>
    json.encode(data.toJson());

class JadwalAbsenSiswa {
  List<Datum> data;

  JadwalAbsenSiswa({
    required this.data,
  });

  factory JadwalAbsenSiswa.fromJson(Map<String, dynamic> json) =>
      JadwalAbsenSiswa(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int idDudi;
  DateTime tanggalMulai;
  DateTime tanggalBerakhir;
  List<Hari> hari;

  Datum({
    required this.id,
    required this.idDudi,
    required this.tanggalMulai,
    required this.tanggalBerakhir,
    required this.hari,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idDudi: json["id_dudi"],
        tanggalMulai: DateTime.parse(json["tanggal_mulai"]),
        tanggalBerakhir: DateTime.parse(json["tanggal_berakhir"]),
        hari: List<Hari>.from(json["hari"].map((x) => Hari.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_dudi": idDudi,
        "tanggal_mulai": tanggalMulai.toIso8601String(),
        "tanggal_berakhir": tanggalBerakhir.toIso8601String(),
        "hari": List<dynamic>.from(hari.map((x) => x.toJson())),
      };
}

class Hari {
  int id;
  String hari;
  String batasAbsenMasuk;
  String batasAbsenPulang;

  Hari({
    required this.id,
    required this.hari,
    required this.batasAbsenMasuk,
    required this.batasAbsenPulang,
  });

  factory Hari.fromJson(Map<String, dynamic> json) => Hari(
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
