abstract class ApiUrl {
  // ALL
  static var urlPostLogin = "http://10.0.2.2:2008/auth/public/login";

  // SISWA
  static var urlGetProfileSiswa = "http://10.0.2.2:2008/siswa/profile";
  static var urlGetAllDudiSiswa = "http://10.0.2.2:2008/siswa/dudi?page=";
  static var urlPostAjuanPkl = "http://10.0.2.2:2008/siswa/pengajuan_pkl";
  static var urlPutCancelAjuanPklSiswa =
      "http://10.0.2.2:2008/siswa/pengajuan_pkl/cancel/";
  static var urlGetLastPengajuanPklSiswa =
      "http://10.0.2.2:2008/siswa/pengajuan_pkl/last/get";
  static var urlGetPengajuanByIdSiswa =
      "http://10.0.2.2:2008/siswa/pengajuan_pkl/";
  static var urlGetNotifUnreadSiswa =
      "http://10.0.2.2:2008/siswa/notification/unread/count";
  static var urlGetAllNotifSiswa = "http://10.0.2.2:2008/siswa/notification";
  static var urlGetAllNotifByIdSiswa = "http://10.0.2.2:2008/siswa/notification";
  static var urlGetAbsenTigaHariSiswa = "http://10.0.2.2:2008/siswa/absen?month=9&isGrouping=false&isSevenDayAgo=true";
  static var urlGetHistoriAbsenDetil = "";
  static var urlGetStatusRadiusSiswa = "http://10.0.2.2:2008/siswa/koordinat-absen/cek";
  static var urlGetJadwalAbsen = "";
}
