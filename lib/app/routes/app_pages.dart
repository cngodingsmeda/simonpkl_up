import 'package:get/get.dart';

import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/siswa/absen_abnormal_siswa/bindings/absen_abnormal_siswa_binding.dart';
import '../modules/siswa/absen_abnormal_siswa/views/absen_abnormal_siswa_view.dart';
import '../modules/siswa/absen_normal_siswa/bindings/absen_normal_siswa_binding.dart';
import '../modules/siswa/absen_normal_siswa/views/absen_normal_siswa_view.dart';
import '../modules/siswa/ajuan_siswa/bindings/ajuan_siswa_binding.dart';
import '../modules/siswa/ajuan_siswa/views/ajuan_siswa_view.dart';
import '../modules/siswa/detil_laporan_siswa/bindings/detil_laporan_siswa_binding.dart';
import '../modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import '../modules/siswa/home_siswa/bindings/home_siswa_binding.dart';
import '../modules/siswa/home_siswa/views/home_siswa_view.dart';
import '../modules/siswa/homepage_siswa/bindings/homepage_siswa_binding.dart';
import '../modules/siswa/homepage_siswa/views/homepage_siswa_view.dart';
import '../modules/siswa/laporan_siswa/bindings/laporan_siswa_binding.dart';
import '../modules/siswa/laporan_siswa/views/laporan_siswa_view.dart';
import '../modules/siswa/notifikasi_siswa/bindings/notifikasi_siswa_binding.dart';
import '../modules/siswa/notifikasi_siswa/views/notifikasi_siswa_view.dart';
import '../modules/siswa/pilih_dudi_siswa/bindings/pilih_dudi_siswa_binding.dart';
import '../modules/siswa/pilih_dudi_siswa/views/pilih_dudi_siswa_view.dart';
import '../modules/siswa/pilihan_absen_siswa/bindings/pilihan_absen_siswa_binding.dart';
import '../modules/siswa/pilihan_absen_siswa/views/pilihan_absen_siswa_view.dart';
import '../modules/siswa/profile_siswa/bindings/profile_siswa_binding.dart';
import '../modules/siswa/profile_siswa/views/profile_siswa_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SISWA,
      page: () => HomeSiswaView(),
      binding: HomeSiswaBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_SISWA,
      page: () => const HomepageSiswaView(),
      binding: HomepageSiswaBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_SISWA,
      page: () => const ProfileSiswaView(),
      binding: ProfileSiswaBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_SISWA,
      page: () => const LaporanSiswaView(),
      binding: LaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_SISWA,
      page: () => const NotifikasiSiswaView(),
      binding: NotifikasiSiswaBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_DUDI_SISWA,
      page: () => const PilihDudiSiswaView(),
      binding: PilihDudiSiswaBinding(),
    ),
    GetPage(
      name: _Paths.AJUAN_SISWA,
      page: () => const AjuanSiswaView(),
      binding: AjuanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_SISWA,
      page: () => const DetilLaporanSiswaView(),
      binding: DetilLaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.PILIHAN_ABSEN_SISWA,
      page: () => const PilihanAbsenSiswaView(),
      binding: PilihanAbsenSiswaBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_NORMAL_SISWA,
      page: () => const AbsenNormalSiswaView(),
      binding: AbsenNormalSiswaBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_ABNORMAL_SISWA,
      page: () => const AbsenAbnormalSiswaView(),
      binding: AbsenAbnormalSiswaBinding(),
    ),
  ];
}
