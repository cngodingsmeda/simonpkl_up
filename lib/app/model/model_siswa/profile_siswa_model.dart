// model/profil.dart
class Profil {
  final String nama;
  final String nisn;
  final String kelas;
  final String noTelepon;
  final String alamat;
  final String statusPkl;
  final String guruPembimbing;

  Profil({
    required this.nama,
    required this.nisn,
    required this.kelas,
    required this.noTelepon,
    required this.alamat,
    required this.statusPkl,
    required this.guruPembimbing,
  });

  factory Profil.fromJson(Map<String, dynamic> json) {
    return Profil(
      nama: json['nama'],
      nisn: json['nisn'],
      kelas: json['kelas'],
      noTelepon: json['no_telepon'],
      alamat: json['alamat'],
      statusPkl: json['status_pkl'],
      guruPembimbing: json['guru_pembimbing'],
    );
  }
}
