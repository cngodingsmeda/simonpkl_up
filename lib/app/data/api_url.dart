abstract class ApiUrl {
  // ALL
  static var urlPostLogin = "http://10.0.2.2:2008/auth/public/login";
  static var urlPostLogout = "http://10.0.2.2:2008/auth/logout";

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
  static var urlPostAbsenMasukSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-masuk";
  static var urlPostAbsenSakitSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-sakit";
  static var urlPostAbsenPulangSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-pulang";
  static var urlPostAbsenLuarRadiusSiswa =
      "http://10.0.2.2:2008/siswa/absen/absen-diluar-radius";
  static var urlGetHistoriAbsenByMonthSiswa =
      "http://10.0.2.2:2008/siswa/absen?isThreeDayAgo=false&month=";
  static var urlGetHistoriAbsenDetilSiswa = "http://10.0.2.2:2008/siswa/absen/";
  static var urlGetAllLaporanHarianSiswa =
      "http://10.0.2.2:2008/siswa/laporan_pkl_siswa";
  static var urlGetAllLaporanKendalaSiswa =
      "http://10.0.2.2:2008/siswa/laporan-kendala";
  static var urlPostLaporanHarianSiswa =
      "http://10.0.2.2:2008/siswa/laporan_pkl_siswa";
  static var urlPutFileLaporanHarianSiswa =
      "http://10.0.2.2:2008/siswa/laporan_pkl_siswa/file_laporan";
  static var urlPostLaporanKendalaSiswa =
      "http://10.0.2.2:2008/siswa/laporan-kendala";
  static var urlPutFileLaporanKendalaSiswa =
      "http://10.0.2.2:2008/siswa/laporan-kendala/file_laporan";

  // GURU
  static var urlGetProfileGuru = "http://10.0.2.2:2008/guru-pembimbing/profile";
  static var urlGetAllSiswaBimbinganGuru =
      "http://10.0.2.2:2008/guru-pembimbing/siswa";
  static var urlGetAllDudiTerkaitGuru =
      "http://10.0.2.2:2008/guru-pembimbing/dudi";
  static var urlGetNotifUnreadGuru =
      "http://10.0.2.2:2008/guru-pembimbing/notification/unread/count";
  static var urlGetAllNotifGuru =
      "http://10.0.2.2:2008/guru-pembimbing/notification";
  static var urlPostReadNotifGuru =
      "http://10.0.2.2:2008/guru-pembimbing/notification/read";
  static var urlGetAllHistoriAbsenSiswaGuru =
      "http://10.0.2.2:2008/guru-pembimbing/absen/all/format";
  static var urlGetAllHistoriAbsenSiswaByIdMonth =
      "http://10.0.2.2:2008/guru-pembimbing/absen";
  static var urlGetHistoriAbsenSiswaById =
      "http://10.0.2.2:2008/guru-pembimbing/absen/";
  static var urlGetKendalaSiswaCountGuru =
      "http://10.0.2.2:2008/guru-pembimbing/laporan-kendala-siswa/get/count";
  static var urlGetAllKendalaSiswaGuru =
      "http://10.0.2.2:2008/guru-pembimbing/laporan-kendala-siswa";
  static var urlGetAllKendalaDudiGuru =
      "http://10.0.2.2:2008/guru-pembimbing/laporan-kendala-dudi";
  static var urlGetAllLaporanHarianSiswaGuru =
      "http://10.0.2.2:2008/guru-pembimbing/laporan-pkl-siswa";
  static var urlGetAllLaporanHarianDudiGuru =
      "http://10.0.2.2:2008/guru-pembimbing/laporan-pkl-dudi";

  // DUDI
  static var urlGetProfileDudi = "http://10.0.2.2:2008/pembimbingDudi/profile";
  static var urlGetNotifUnreadDudi =
      "http://10.0.2.2:2008/pembimbingDudi/notification/unread/count";
  static var urlGetCountSiswaDudi =
      "http://10.0.2.2:2008/pembimbingDudi/siswa/get/count";
  static var urlGetAllPengajuanPKLDudi =
      "http://10.0.2.2:2008/pembimbingDudi/pengajuan-pkl";
  static var urlGetAllNotifDudi =
      "http://10.0.2.2:2008/pembimbingDudi/notification";
  static var urlGetAllSiswaDudi = "http://10.0.2.2:2008/pembimbingDudi/siswa";
  static var urlGetAllJurusanDudi = "http://10.0.2.2:2008/pembimbingDudi/jurusan";
  static var urlGetAllHistoriAbsenSiswaByIdMonthDudi =
      "http://10.0.2.2:2008/pembimbingDudi/absen";
  static var urlGetCountKuotaSiswaDudi =
      "http://10.0.2.2:2008/pembimbingDudi/kuota";
  static var urlGetAllLaporanKendalaDudi =
      "http://10.0.2.2:2008/pembimbingDudi/laporan-pkl-kendala";
  static var urlGetAllLaporanHarianDudi =
      "http://10.0.2.2:2008/pembimbingDudi/laporan-pkl";
  static var urlPostLaporanKendalaDudi =
      "http://10.0.2.2:2008/pembimbingDudi/laporan-pkl-kendala";
  static var urlPutFileLaporanKendalaDudi =
      "http://10.0.2.2:2008/pembimbingDudi/laporan-pkl-kendala/file";
  static var urlPostLaporanHarianDudi =
      "http://10.0.2.2:2008/pembimbingDudi/laporan-pkl";
  static var urlPutFileLaporanHarianDudi =
      "http://10.0.2.2:2008/pembimbingDudi/laporan-pkl/file";
  static var urlGetKuotaSiswaDudi =
      "http://10.0.2.2:2008/pembimbingDudi/kuota";
  static var urlPostKoordinatAbsen =
      "http://10.0.2.2:2008/pembimbingDudi/koordinat-absen";
  static var urlJadwalAbsenDudi =
      "http://10.0.2.2:2008/pembimbingDudi/jadwal-absen";
}
