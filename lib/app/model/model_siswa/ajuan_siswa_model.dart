class AjuanSiswa {
  final String status;
  final String instansiNama;
  final String batasVerifikasi;
  final String noTeleponInstansi;
  final String alamatInstansi;

  AjuanSiswa({
    required this.status,
    required this.instansiNama,
    required this.batasVerifikasi,
    required this.noTeleponInstansi,
    required this.alamatInstansi,
  });

  factory AjuanSiswa.fromJson(Map<String, dynamic> json) {
    return AjuanSiswa(
      status: json['status'],
      instansiNama: json['instansi_nama'],
      batasVerifikasi: json['batas_verifikasi'],
      noTeleponInstansi: json['no_telepon_instansi'],
      alamatInstansi: json['alamat_instansi'],
    );
  }
}
