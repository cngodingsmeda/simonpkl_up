abstract class ApiUrl {
  // ALL
  static var urlPostLogin = "http://10.0.2.2:2008/auth/public/login";

  // SISWA
  static var urlGetProfileSiswa = "http://10.0.2.2:2008/siswa/profile";
  static var urlGetAllDudiSiswa = "http://10.0.2.2:2008/siswa/dudi?page=";
  static var urlGetDudiByIdsiswa = "http://10.0.2.2:2008/siswa/dudi/";
  static var urlPostAjuanPklSiswa = "http://10.0.2.2:2008/siswa/pengajuan_pkl";
  static var urlPutCancelAjuanPklSiswa =
      "http://10.0.2.2:2008/siswa/pengajuan_pkl/cancel/";
  static var urlGetLastPengajuanPklSiswa =
      "http://10.0.2.2:2008/siswa/pengajuan_pkl/last/get";
  static var urlGetPengajuanByIdSiswa =
      "http://10.0.2.2:2008/siswa/pengajuan_pkl/";
  static var urlGetNotifUnreadSiswa =
      "http://10.0.2.2:2008/siswa/notification/unread/count";
  static var urlGetAllNotifSiswa = "http://10.0.2.2:2008/siswa/notification";
  static var urlGetAllNotifByIdSiswa =
      "http://10.0.2.2:2008/siswa/notification";
  static var urlGetAbsenTigaHariSiswa =
      "http://10.0.2.2:2008/siswa/absen?isGrouping=false&isThreeDayAgo=true";
  static var urlGetAllJadwalAbsenSiswa =
      "http://10.0.2.2:2008/siswa/absen-jadwal";
  static var urlGetStatusRadiusSiswa =
      "http://10.0.2.2:2008/siswa/koordinat-absen/cek";
  static var urlGetJenisAbsenSiswa =
      "http://10.0.2.2:2008/siswa/absen-jadwal/cek";
  static var urlPostAbsenTelatSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-izin-telat";
  static var urlPostAbsenMasukSiswa = "http://10.0.2.2:2008/siswa/absen/absen-masuk";
  static var urlPostAbsenSakitSiswa = "http://10.0.2.2:2008/siswa/absen/absen-sakit";
  static var urlPostAbsenPulangSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-pulang";
  static var urlPostAbsenLuarRadiusSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-diluar-radius";
  static var urlGetHistoriAbsenByMonthSiswa =
      "http://10.0.2.2:2008/siswa/absen?isThreeDayAgo=false&month=";
  static var urlGetHistoriAbsenDetilSiswa = "http://10.0.2.2:2008/siswa/absen/";
  static var urlGetAllLaporanHarianSiswa = "http://10.0.2.2:2008/siswa/laporan_pkl_siswa";
}
