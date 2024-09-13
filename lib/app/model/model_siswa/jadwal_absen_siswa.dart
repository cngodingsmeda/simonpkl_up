class JadwalAbsenSiswa {
  final String nama;
  final String alamat;
  final String jamMasuk;
  final String jamKeluar;

  JadwalAbsenSiswa({
    required this.nama,
    required this.alamat,
    required this.jamMasuk,
    required this.jamKeluar,
  });

  factory JadwalAbsenSiswa.fromJson(Map<String, dynamic> json) {
    return JadwalAbsenSiswa(
      nama: json['nama'],
      alamat: json['alamat'],
      jamMasuk: json['jamMasuk'],
      jamKeluar: json['jamKeluar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'alamat': alamat,
      'jamMasuk': jamMasuk,
      'jamKeluar': jamKeluar,
    };
  }
}
