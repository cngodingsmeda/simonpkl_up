// model/laporanDetilSiswa.dart
class LaporanDetilSiswa {
  final String tanggal;
  final String status;
  final String waktu;
  final String keteranganWaktu;
  final String instansiTerkait;
  final String jamDitentukan;

  LaporanDetilSiswa({
    required this.tanggal,
    required this.status,
    required this.waktu,
    required this.keteranganWaktu,
    required this.instansiTerkait,
    required this.jamDitentukan,
  });

  factory LaporanDetilSiswa.fromJson(Map<String, dynamic> json) {
    return LaporanDetilSiswa(
      tanggal: json['tanggal'] ?? 'N/A',
      status: json['status'] ?? 'N/A',
      waktu: json['waktu'] ?? 'N/A',
      keteranganWaktu: json['keterangan_waktu'] ?? 'N/A',
      instansiTerkait: json['instansi_terkait'] ?? 'N/A',
      jamDitentukan: json['jam_ditentukan'] ?? 'N/A',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tanggal': tanggal,
      'status': status,
      'waktu': waktu,
      'keterangan_waktu': keteranganWaktu,
      'instansi_terkait': instansiTerkait,
      'jam_ditentukan': jamDitentukan,
    };
  }
}
