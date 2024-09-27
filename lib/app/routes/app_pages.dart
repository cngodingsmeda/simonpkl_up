import 'package:get/get.dart';

import '../modules/dudi/verifikasi_selesai_pkl_siswa_dudi/bindings/verifikasi_selesai_pkl_siswa_dudi_binding.dart';
import '../modules/dudi/verifikasi_selesai_pkl_siswa_dudi/views/verifikasi_selesai_pkl_siswa_dudi_view.dart';
import '../modules/dudi/ajuan_pkl_siswa_dudi/bindings/ajuan_pkl_siswa_dudi_binding.dart';
import '../modules/dudi/ajuan_pkl_siswa_dudi/views/ajuan_pkl_siswa_dudi_view.dart';
import '../modules/dudi/data_siswa_dudi/bindings/data_siswa_dudi_binding.dart';
import '../modules/dudi/data_siswa_dudi/views/data_siswa_dudi_view.dart';
import '../modules/dudi/home_dudi/bindings/home_dudi_binding.dart';
import '../modules/dudi/home_dudi/views/home_dudi_view.dart';
import '../modules/dudi/homepage_dudi/bindings/homepage_dudi_binding.dart';
import '../modules/dudi/homepage_dudi/views/homepage_dudi_view.dart';
import '../modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/bindings/menunggu_verifikasi_pkl_siswa_dudi_binding.dart';
import '../modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/views/menunggu_verifikasi_pkl_siswa_dudi_view.dart';
import '../modules/dudi/profile_dudi/bindings/profile_dudi_binding.dart';
import '../modules/dudi/profile_dudi/views/profile_dudi_view.dart';
import '../modules/guru/detil_laporan_guru/bindings/detil_laporan_guru_binding.dart';
import '../modules/guru/detil_laporan_guru/views/detil_laporan_guru_view.dart';
import '../modules/guru/detil_siswa_guru/bindings/detil_siswa_guru_binding.dart';
import '../modules/guru/detil_siswa_guru/views/detil_siswa_guru_view.dart';
import '../modules/guru/histori_absen_siswa_guru/bindings/histori_absen_siswa_guru_binding.dart';
import '../modules/guru/histori_absen_siswa_guru/views/histori_absen_siswa_guru_view.dart';
import '../modules/guru/home_guru/bindings/home_guru_binding.dart';
import '../modules/guru/home_guru/views/home_guru_view.dart';
import '../modules/guru/homepage_guru/bindings/homepage_guru_binding.dart';
import '../modules/guru/homepage_guru/views/homepage_guru_view.dart';
import '../modules/guru/laporan_absen_siswa_guru/bindings/laporan_absen_siswa_guru_binding.dart';
import '../modules/guru/laporan_absen_siswa_guru/views/laporan_absen_siswa_guru_view.dart';
import '../modules/guru/laporan_siswa_guru/bindings/laporan_siswa_guru_binding.dart';
import '../modules/guru/laporan_siswa_guru/views/laporan_siswa_guru_view.dart';
import '../modules/guru/monitoring_guru/bindings/monitoring_guru_binding.dart';
import '../modules/guru/monitoring_guru/views/monitoring_guru_view.dart';
import '../modules/guru/notifikasi_guru/bindings/notifikasi_guru_binding.dart';
import '../modules/guru/notifikasi_guru/views/notifikasi_guru_view.dart';
import '../modules/guru/profile_guru/bindings/profile_guru_binding.dart';
import '../modules/guru/profile_guru/views/profile_guru_view.dart';
import '../modules/login_page/bindings/login_page_binding.dart';
import '../modules/login_page/views/login_page_view.dart';
import '../modules/siswa/absen_abnormal_siswa/bindings/absen_abnormal_siswa_binding.dart';
import '../modules/siswa/absen_abnormal_siswa/views/absen_abnormal_siswa_view.dart';
import '../modules/siswa/absen_normal_siswa/bindings/absen_normal_siswa_binding.dart';
import '../modules/siswa/absen_normal_siswa/views/absen_normal_siswa_view.dart';
import '../modules/siswa/ajuan_siswa/bindings/ajuan_siswa_binding.dart';
import '../modules/siswa/ajuan_siswa/views/ajuan_siswa_view.dart';
import '../modules/siswa/buat_laporan_siswa/bindings/buat_laporan_siswa_binding.dart';
import '../modules/siswa/buat_laporan_siswa/views/buat_laporan_siswa_view.dart';
import '../modules/siswa/detil_histori_absen_siswa/bindings/detil_histori_absen_siswa_binding.dart';
import '../modules/siswa/detil_histori_absen_siswa/views/detil_histori_absen_siswa_view.dart';
import '../modules/siswa/detil_laporan_siswa/bindings/detil_laporan_siswa_binding.dart';
import '../modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import '../modules/siswa/detil_notifikasi_siswa/bindings/detil_notifikasi_siswa_binding.dart';
import '../modules/siswa/detil_notifikasi_siswa/views/detil_notifikasi_siswa_view.dart';
import '../modules/siswa/histori_absen_siswa/bindings/histori_absen_siswa_binding.dart';
import '../modules/siswa/histori_absen_siswa/views/histori_absen_siswa_view.dart';
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
      name: _Paths.HISTORI_ABSEN_SISWA,
      page: () => const HistoriAbsenSiswaView(),
      binding: HistoriAbsenSiswaBinding(),
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
      name: _Paths.DETIL_HISTORI_ABSEN_SISWA,
      page: () => const DetilHistoriAbsenSiswaView(),
      binding: DetilHistoriAbsenSiswaBinding(),
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
    GetPage(
      name: _Paths.DETIL_NOTIFIKASI_SISWA,
      page: () => const DetilNotifikasiSiswaView(),
      binding: DetilNotifikasiSiswaBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_SISWA,
      page: () => const LaporanSiswaView(),
      binding: LaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_SISWA,
      page: () => const DetilLaporanSiswaView(),
      binding: DetilLaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_LAPORAN_SISWA,
      page: () => const BuatLaporanSiswaView(),
      binding: BuatLaporanSiswaBinding(),
    ),
    GetPage(
      name: _Paths.HOME_GURU,
      page: () => HomeGuruView(),
      binding: HomeGuruBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_GURU,
      page: () => const HomepageGuruView(),
      binding: HomepageGuruBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_SISWA_GURU,
      page: () => const LaporanAbsenSiswaGuruView(),
      binding: LaporanAbsenSiswaGuruBinding(),
      children: [
        GetPage(
          name: _Paths.LAPORAN_SISWA_GURU,
          page: () => const LaporanSiswaGuruView(),
          binding: LaporanSiswaGuruBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROFILE_GURU,
      page: () => const ProfileGuruView(),
      binding: ProfileGuruBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_GURU,
      page: () => const NotifikasiGuruView(),
      binding: NotifikasiGuruBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_SISWA_GURU,
      page: () => const DetilSiswaGuruView(),
      binding: DetilSiswaGuruBinding(),
    ),
    GetPage(
      name: _Paths.HISTORI_ABSEN_SISWA_GURU,
      page: () => const HistoriAbsenSiswaGuruView(),
      binding: HistoriAbsenSiswaGuruBinding(),
    ),
    GetPage(
      name: _Paths.MONITORING_GURU,
      page: () => const MonitoringGuruView(),
      binding: MonitoringGuruBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_GURU,
      page: () => const DetilLaporanGuruView(),
      binding: DetilLaporanGuruBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DUDI,
      page: () => HomeDudiView(),
      binding: HomeDudiBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE_DUDI,
      page: () => const HomepageDudiView(),
      binding: HomepageDudiBinding(),
    ),
    GetPage(
      name: _Paths.DATA_SISWA_DUDI,
      page: () => const DataSiswaDudiView(),
      binding: DataSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DUDI,
      page: () => const ProfileDudiView(),
      binding: ProfileDudiBinding(),
    ),
    GetPage(
      name: _Paths.AJUAN_PKL_SISWA_DUDI,
      page: () => const AjuanPklSiswaDudiView(),
      binding: AjuanPklSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.MENUNGGU_VERIFIKASI_PKL_SISWA_DUDI,
      page: () => const MenungguVerifikasiPklSiswaDudiView(),
      binding: MenungguVerifikasiPklSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.VERIFIKASI_SELESAI_PKL_SISWA_DUDI,
      page: () => const VerifikasiSelesaiPklSiswaDudiView(),
      binding: VerifikasiSelesaiPklSiswaDudiBinding(),
    ),
  ];
}
