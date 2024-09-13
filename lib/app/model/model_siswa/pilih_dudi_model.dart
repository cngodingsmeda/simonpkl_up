// lib/app/models/dudi_model.dart
class PilihDudiModel {
  final String namaInstansi;
  final String tahun;
  final String noTelepon;
  final String bidang;
  final String alamat;
  final String deskripsi;
  final int kuotaLakiLaki;
  final int maxKuotaLakiLaki;
  final int kuotaPerempuan;
  final int maxKuotaPerempuan;
  final int siswaCount;

  PilihDudiModel({
    required this.namaInstansi,
    required this.tahun,
    required this.noTelepon,
    required this.bidang,
    required this.alamat,
    required this.deskripsi,
    required this.kuotaLakiLaki,
    required this.maxKuotaLakiLaki,
    required this.kuotaPerempuan,
    required this.maxKuotaPerempuan,
    required this.siswaCount,
  });

  factory PilihDudiModel.fromJson(Map<String, dynamic> json) {
    return PilihDudiModel(
      namaInstansi: json['nama_instansi'],
      tahun: json['tahun'],
      noTelepon: json['no_telepon'],
      bidang: json['bidang'],
      alamat: json['alamat'],
      deskripsi: json['deskripsi'],
      kuotaLakiLaki: json['kuota_laki_laki'],
      maxKuotaLakiLaki: json['max_kuota_laki_laki'],
      kuotaPerempuan: json['kuota_perempuan'],
      maxKuotaPerempuan: json['max_kuota_perempuan'],
      siswaCount: json['siswa_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_instansi': namaInstansi,
      'tahun': tahun,
      'no_telepon': noTelepon,
      'bidang': bidang,
      'alamat': alamat,
      'deskripsi': deskripsi,
      'kuota_laki_laki': kuotaLakiLaki,
      'max_kuota_laki_laki': maxKuotaLakiLaki,
      'kuota_perempuan': kuotaPerempuan,
      'max_kuota_perempuan': maxKuotaPerempuan,
      'siswa_count': siswaCount,
    };
  }
}
