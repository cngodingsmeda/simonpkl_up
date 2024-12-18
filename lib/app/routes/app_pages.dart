import 'package:get/get.dart';

import '../modules/dudi/buat_jadwal_absen_dudi/bindings/buat_jadwal_absen_dudi_binding.dart';
import '../modules/dudi/buat_jadwal_absen_dudi/views/buat_jadwal_absen_dudi_view.dart';
import '../modules/dudi/ajuan_pkl_siswa_dudi/bindings/ajuan_pkl_siswa_dudi_binding.dart';
import '../modules/dudi/ajuan_pkl_siswa_dudi/views/ajuan_pkl_siswa_dudi_view.dart';
import '../modules/dudi/buat_form_pkl_dudi/bindings/buat_form_pkl_dudi_binding.dart';
import '../modules/dudi/buat_form_pkl_dudi/views/buat_form_pkl_dudi_view.dart';
import '../modules/dudi/buat_laporan_pkl_dudi/bindings/buat_laporan_pkl_dudi_binding.dart';
import '../modules/dudi/buat_laporan_pkl_dudi/views/buat_laporan_pkl_dudi_view.dart';
import '../modules/dudi/daftar_lokasi_absen_dudi/bindings/daftar_lokasi_absen_dudi_binding.dart';
import '../modules/dudi/daftar_lokasi_absen_dudi/views/daftar_lokasi_absen_dudi_view.dart';
import '../modules/dudi/data_siswa_dudi/bindings/data_siswa_dudi_binding.dart';
import '../modules/dudi/data_siswa_dudi/views/data_siswa_dudi_view.dart';
import '../modules/dudi/detil_histori_absen_siswa_dudi/bindings/detil_histori_absen_siswa_dudi_binding.dart';
import '../modules/dudi/detil_histori_absen_siswa_dudi/views/detil_histori_absen_siswa_dudi_view.dart';
import '../modules/dudi/detil_laporan_pkl_dudi/bindings/detil_laporan_pkl_dudi_binding.dart';
import '../modules/dudi/detil_laporan_pkl_dudi/views/detil_laporan_pkl_dudi_view.dart';
import '../modules/dudi/detil_notifikasi_dudi/bindings/detil_notifikasi_dudi_binding.dart';
import '../modules/dudi/detil_notifikasi_dudi/views/detil_notifikasi_dudi_view.dart';
import '../modules/dudi/detil_siswa_dudi/bindings/detil_siswa_dudi_binding.dart';
import '../modules/dudi/detil_siswa_dudi/views/detil_siswa_dudi_view.dart';
import '../modules/dudi/form_rekrut_siswa_dudi/bindings/form_rekrut_siswa_dudi_binding.dart';
import '../modules/dudi/form_rekrut_siswa_dudi/views/form_rekrut_siswa_dudi_view.dart';
import '../modules/dudi/histori_absen_siswa_dudi/bindings/histori_absen_siswa_dudi_binding.dart';
import '../modules/dudi/histori_absen_siswa_dudi/views/histori_absen_siswa_dudi_view.dart';
import '../modules/dudi/home_dudi/bindings/home_dudi_binding.dart';
import '../modules/dudi/home_dudi/views/home_dudi_view.dart';
import '../modules/dudi/homepage_dudi/bindings/homepage_dudi_binding.dart';
import '../modules/dudi/homepage_dudi/views/homepage_dudi_view.dart';
import '../modules/dudi/jadwal_absen_siswa_dudi/bindings/jadwal_absen_siswa_dudi_binding.dart';
import '../modules/dudi/jadwal_absen_siswa_dudi/views/jadwal_absen_siswa_dudi_view.dart';
import '../modules/dudi/kuota_umum_dudi/bindings/kuota_umum_dudi_binding.dart';
import '../modules/dudi/kuota_umum_dudi/views/kuota_umum_dudi_view.dart';
import '../modules/dudi/laporan_kendala_dudi/bindings/laporan_kendala_dudi_binding.dart';
import '../modules/dudi/laporan_kendala_dudi/views/laporan_kendala_dudi_view.dart';
import '../modules/dudi/laporan_pkl_dudi/bindings/laporan_pkl_dudi_binding.dart';
import '../modules/dudi/laporan_pkl_dudi/views/laporan_pkl_dudi_view.dart';
import '../modules/dudi/lokasi_absen_dudi/bindings/lokasi_absen_dudi_binding.dart';
import '../modules/dudi/lokasi_absen_dudi/views/lokasi_absen_dudi_view.dart';
import '../modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/bindings/menunggu_verifikasi_pkl_siswa_dudi_binding.dart';
import '../modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/views/menunggu_verifikasi_pkl_siswa_dudi_view.dart';
import '../modules/dudi/notifikasi_dudi/bindings/notifikasi_dudi_binding.dart';
import '../modules/dudi/notifikasi_dudi/views/notifikasi_dudi_view.dart';
import '../modules/dudi/profile_dudi/bindings/profile_dudi_binding.dart';
import '../modules/dudi/profile_dudi/views/profile_dudi_view.dart';
import '../modules/dudi/skema_pkl_dudi/bindings/skema_pkl_dudi_binding.dart';
import '../modules/dudi/skema_pkl_dudi/views/skema_pkl_dudi_view.dart';
import '../modules/dudi/verifikasi_dibatalkan_siswa_dudi/bindings/verifikasi_dibatalkan_siswa_dudi_binding.dart';
import '../modules/dudi/verifikasi_dibatalkan_siswa_dudi/views/verifikasi_dibatalkan_siswa_dudi_view.dart';
import '../modules/dudi/verifikasi_selesai_pkl_siswa_dudi/bindings/verifikasi_selesai_pkl_siswa_dudi_binding.dart';
import '../modules/dudi/verifikasi_selesai_pkl_siswa_dudi/views/verifikasi_selesai_pkl_siswa_dudi_view.dart';
import '../modules/guru/detil_absen_siswa_guru/bindings/detil_absen_siswa_guru_binding.dart';
import '../modules/guru/detil_absen_siswa_guru/views/detil_absen_siswa_guru_view.dart';
import '../modules/guru/detil_laporan_dudi_guru/bindings/detil_laporan_dudi_guru_binding.dart';
import '../modules/guru/detil_laporan_dudi_guru/views/detil_laporan_dudi_guru_view.dart';
import '../modules/guru/detil_laporan_siswa_guru/bindings/detil_laporan_siswa_guru_binding.dart';
import '../modules/guru/detil_laporan_siswa_guru/views/detil_laporan_siswa_guru_view.dart';
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
import '../modules/siswa/batalkan_pkl_siswa/bindings/batalkan_pkl_siswa_binding.dart';
import '../modules/siswa/batalkan_pkl_siswa/views/batalkan_pkl_siswa_view.dart';
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
import '../modules/siswa/laporan_kendala_siswa/bindings/laporan_kendala_siswa_binding.dart';
import '../modules/siswa/laporan_kendala_siswa/views/laporan_kendala_siswa_view.dart';
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
    GetPage(
      name: _Paths.DETIL_SISWA_DUDI,
      page: () => const DetilSiswaDudiView(),
      binding: DetilSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.HISTORI_ABSEN_SISWA_DUDI,
      page: () => const HistoriAbsenSiswaDudiView(),
      binding: HistoriAbsenSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.VERIFIKASI_DIBATALKAN_SISWA_DUDI,
      page: () => const VerifikasiDibatalkanSiswaDudiView(),
      binding: VerifikasiDibatalkanSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.SKEMA_PKL_DUDI,
      page: () => const SkemaPklDudiView(),
      binding: SkemaPklDudiBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_PKL_DUDI,
      page: () => const LaporanPklDudiView(),
      binding: LaporanPklDudiBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_PKL_DUDI,
      page: () => const DetilLaporanPklDudiView(),
      binding: DetilLaporanPklDudiBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_LAPORAN_PKL_DUDI,
      page: () => const BuatLaporanPklDudiView(),
      binding: BuatLaporanPklDudiBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_FORM_PKL_DUDI,
      page: () => const BuatFormPklDudiView(),
      binding: BuatFormPklDudiBinding(),
    ),
    GetPage(
      name: _Paths.BATALKAN_PKL_SISWA,
      page: () => const BatalkanPklSiswaView(),
      binding: BatalkanPklSiswaBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_KENDALA_SISWA,
      page: () => const LaporanKendalaSiswaView(),
      binding: LaporanKendalaSiswaBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_ABSEN_SISWA_GURU,
      page: () => const DetilAbsenSiswaGuruView(),
      binding: DetilAbsenSiswaGuruBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_SISWA_GURU,
      page: () => const DetilLaporanSiswaGuruView(),
      binding: DetilLaporanSiswaGuruBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_LAPORAN_DUDI_GURU,
      page: () => const DetilLaporanDudiGuruView(),
      binding: DetilLaporanDudiGuruBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFIKASI_DUDI,
      page: () => const NotifikasiDudiView(),
      binding: NotifikasiDudiBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_NOTIFIKASI_DUDI,
      page: () => const DetilNotifikasiDudiView(),
      binding: DetilNotifikasiDudiBinding(),
    ),
    GetPage(
      name: _Paths.DETIL_HISTORI_ABSEN_SISWA_DUDI,
      page: () => const DetilHistoriAbsenSiswaDudiView(),
      binding: DetilHistoriAbsenSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_KENDALA_DUDI,
      page: () => const LaporanKendalaDudiView(),
      binding: LaporanKendalaDudiBinding(),
    ),
    GetPage(
      name: _Paths.FORM_REKRUT_SISWA_DUDI,
      page: () => const FormRekrutSiswaDudiView(),
      binding: FormRekrutSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL_ABSEN_SISWA_DUDI,
      page: () => const JadwalAbsenSiswaDudiView(),
      binding: JadwalAbsenSiswaDudiBinding(),
    ),
    GetPage(
      name: _Paths.KUOTA_UMUM_DUDI,
      page: () => const KuotaUmumDudiView(),
      binding: KuotaUmumDudiBinding(),
    ),
    GetPage(
      name: _Paths.LOKASI_ABSEN_DUDI,
      page: () => const LokasiAbsenDudiView(),
      binding: LokasiAbsenDudiBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_LOKASI_ABSEN_DUDI,
      page: () => const DaftarLokasiAbsenDudiView(),
      binding: DaftarLokasiAbsenDudiBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_JADWAL_ABSEN_DUDI,
      page: () => const BuatJadwalAbsenDudiView(),
      binding: BuatJadwalAbsenDudiBinding(),
    ),
  ];
}
