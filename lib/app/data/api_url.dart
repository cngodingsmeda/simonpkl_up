abstract class ApiUrl {
  static String url = "http://103.56.148.178:2008";
  static String siswa = "siswa";
  static String guruPembimbing = "guru-pembimbing";
  static String pembimbingDudi = "pembimbingDudi";

  // ALL
  static var urlPostLogin = "$url/auth/public/login";
  static var urlPostLogout = "$url/auth/logout";

  // SISWA
  static var urlGetProfileSiswa = "$url/$siswa/profile";
  static var urlGetAllDudiSiswa = "$url/$siswa/dudi";
  static var urlGetDudiByIdsiswa = "$url/$siswa/dudi/";
  static var urlPostAjuanPklSiswa = "$url/$siswa/pengajuan_pkl";
  static var urlPutCancelAjuanPklSiswa = "$url/$siswa/pengajuan_pkl/cancel/";
  static var urlGetLastPengajuanPklSiswa = "$url/$siswa/pengajuan_pkl/last/get";
  static var urlGetPengajuanByIdSiswa = "$url/$siswa/pengajuan_pkl/";
  static var urlGetNotifUnreadSiswa = "$url/$siswa/notification/unread/count";
  static var urlGetAllNotifSiswa = "$url/$siswa/notification";
  static var urlGetAllNotifByIdSiswa = "$url/$siswa/notification";
  static var urlGetAbsenTigaHariSiswa =
      "$url/$siswa/absen?isGrouping=false&isThreeDayAgo=true";
  static var urlGetAllJadwalAbsenSiswa = "$url/$siswa/absen-jadwal";
  static var urlGetStatusRadiusSiswa = "$url/$siswa/koordinat-absen/cek";
  static var urlGetJenisAbsenSiswa = "$url/$siswa/absen-jadwal/cek";
  static var urlPostAbsenTelatSiswa = "$url/$siswa/absen/absen-izin-telat";
  static var urlPostAbsenMasukSiswa = "$url/$siswa/absen/absen-masuk";
  static var urlPostAbsenSakitSiswa = "$url/$siswa/absen/absen-sakit";
  static var urlPostAbsenPulangSiswa = "$url/$siswa/absen/absen-pulang";
  static var urlPostAbsenLuarRadiusSiswa =
      "$url/$siswa/absen/absen-diluar-radius";
  static var urlGetHistoriAbsenByMonthSiswa =
      "$url/$siswa/absen?isThreeDayAgo=false&month=";
  static var urlGetHistoriAbsenDetilSiswa = "$url/$siswa/absen/";
  static var urlGetAllLaporanHarianSiswa = "$url/$siswa/laporan_pkl_siswa";
  static var urlGetAllLaporanKendalaSiswa = "$url/$siswa/laporan-kendala";
  static var urlPostLaporanHarianSiswa = "$url/$siswa/laporan_pkl_siswa";
  static var urlPutFileLaporanHarianSiswa =
      "$url/$siswa/laporan_pkl_siswa/file_laporan";
  static var urlPostLaporanKendalaSiswa = "$url/$siswa/laporan-kendala";
  static var urlPutFileLaporanKendalaSiswa =
      "$url/$siswa/laporan-kendala/file_laporan";

  // GURU
  static var urlGetProfileGuru = "$url/$guruPembimbing/profile";
  static var urlGetAllSiswaBimbinganGuru = "$url/$guruPembimbing/siswa";
  static var urlGetAllDudiTerkaitGuru = "$url/$guruPembimbing/dudi";
  static var urlGetNotifUnreadGuru =
      "$url/$guruPembimbing/notification/unread/count";
  static var urlGetAllNotifGuru = "$url/$guruPembimbing/notification";
  static var urlPostReadNotifGuru = "$url/$guruPembimbing/notification/read";
  static var urlGetAllHistoriAbsenSiswaGuru =
      "$url/$guruPembimbing/absen/all/format";
  static var urlGetAllHistoriAbsenSiswaByIdMonth = "$url/$guruPembimbing/absen";
  static var urlGetHistoriAbsenSiswaById = "$url/$guruPembimbing/absen/";
  static var urlGetKendalaSiswaCountGuru =
      "$url/$guruPembimbing/laporan-kendala-siswa/get/count";
  static var urlGetAllKendalaSiswaGuru =
      "$url/$guruPembimbing/laporan-kendala-siswa";
  static var urlGetAllKendalaDudiGuru =
      "$url/$guruPembimbing/laporan-kendala-dudi";
  static var urlGetAllLaporanHarianSiswaGuru =
      "$url/$guruPembimbing/laporan-pkl-siswa";
  static var urlGetAllLaporanHarianDudiGuru =
      "$url/$guruPembimbing/laporan-pkl-dudi";

  // DUDI
  static var urlGetProfileDudi = "$url/$pembimbingDudi/profile";
  static var urlGetNotifUnreadDudi =
      "$url/$pembimbingDudi/notification/unread/count";
  static var urlGetCountSiswaDudi = "$url/$pembimbingDudi/siswa/get/count";
  static var urlGetAllPengajuanPKLDudi = "$url/$pembimbingDudi/pengajuan-pkl";
  static var urlGetAllNotifDudi = "$url/$pembimbingDudi/notification";
  static var urlGetAllSiswaDudi = "$url/$pembimbingDudi/siswa";
  static var urlGetAllJurusanDudi = "$url/$pembimbingDudi/jurusan";
  static var urlGetAllHistoriAbsenSiswaByIdMonthDudi =
      "$url/$pembimbingDudi/absen";
  static var urlGetCountKuotaSiswaDudi = "$url/$pembimbingDudi/kuota";
  static var urlGetAllLaporanKendalaDudi =
      "$url/$pembimbingDudi/laporan-pkl-kendala";
  static var urlGetAllLaporanHarianDudi = "$url/$pembimbingDudi/laporan-pkl";
  static var urlPostLaporanKendalaDudi =
      "$url/$pembimbingDudi/laporan-pkl-kendala";
  static var urlPutFileLaporanKendalaDudi =
      "$url/$pembimbingDudi/laporan-pkl-kendala/file";
  static var urlPostLaporanHarianDudi = "$url/$pembimbingDudi/laporan-pkl";
  static var urlPutFileLaporanHarianDudi =
      "$url/$pembimbingDudi/laporan-pkl/file";
  static var urlGetKuotaSiswaDudi = "$url/$pembimbingDudi/kuota";
  static var urlPostKoordinatAbsen = "$url/$pembimbingDudi/koordinat-absen";
  static var urlJadwalAbsenDudi = "$url/$pembimbingDudi/jadwal-absen";
}
