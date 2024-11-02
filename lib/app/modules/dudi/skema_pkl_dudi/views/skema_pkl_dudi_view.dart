import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/daftar_lokasi_absen_dudi/views/daftar_lokasi_absen_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/form_rekrut_siswa_dudi/views/form_rekrut_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/homepage_dudi/controllers/homepage_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/jadwal_absen_siswa_dudi/views/jadwal_absen_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/kuota_umum_dudi/views/kuota_umum_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_kendala_dudi/views/laporan_kendala_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/views/laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/controllers/profile_dudi_controller.dart';

import '../controllers/skema_pkl_dudi_controller.dart';

class SkemaPklDudiView extends GetView<SkemaPklDudiController> {
  const SkemaPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    final profController = Get.put(ProfileDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.22,
              width: Get.width,
              decoration: const BoxDecoration(
                color: AllMaterial.colorBlue,
                image: DecorationImage(
                  image: AssetImage('assets/logo/opacity.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "Skema PKL ${AllMaterial.formatNamaPanjang(profController.profil.value?.dudi?.namaInstansiPerusahaan ?? "")}",
                      style: AllMaterial.montSerrat(
                        fontWeight: AllMaterial.fontBold,
                        fontSize: 18,
                        color: AllMaterial.colorWhite,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Pembimbing Dudi : ${AllMaterial.setiapNamaHurufPertama(profController.profil.value?.nama ?? "")}",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontSemiBold,
                            color: AllMaterial.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              decoration: BoxDecoration(
                color: AllMaterial.colorWhite,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.04),
                    blurRadius: 20,
                    offset: const Offset(-12, -5),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonAbsen(
                        nama: "Kuota Umum",
                        svg: "assets/icons/kuota-umum.svg",
                        tekan: () {
                          Get.to(() => const KuotaUmumDudiView());
                        },
                      ),
                      const SizedBox(width: 12),
                      ButtonAbsen(
                        nama: "Kuota Jurusan",
                        svg: "assets/icons/buat-rekrut.svg",
                        tekan: () {
                          Get.to(() => const FormRekrutSiswaDudiView());
                          AllMaterial.box.write("isJadwal", false);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonAbsen(
                        nama: "Lokasi Absen",
                        svg: "assets/icons/lokasi.svg",
                        tekan: () {
                          Get.to(() => const DaftarLokasiAbsenDudiView());
                        },
                      ),
                      const SizedBox(width: 12),
                      ButtonAbsen(
                        nama: "Jadwal Absen",
                        svg: "assets/icons/buat-jadwal.svg",
                        tekan: () {
                          Get.to(() => const JadwalAbsenSiswaDudiView());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonAbsen(
                        nama: "Buat Laporan",
                        svg: "assets/icons/edit-rekrut.svg",
                        tekan: () {
                          Get.to(
                            () => const LaporanPklDudiView(),
                          );
                          LaporanPklDudiController.isKendala.value = false;
                        },
                      ),
                      const SizedBox(width: 10),
                      ButtonAbsen(
                        nama: "Lapor Kendala",
                        svg: "assets/icons/kendala-toa.svg",
                        tekan: () {
                          Get.to(
                            () => const LaporanKendalaDudiView(),
                          );
                          LaporanPklDudiController.isKendala.value = true;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.back();
          final homePageDudi = Get.put(HomepageDudiController());
          homePageDudi.getCountKuotaDudi();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: AllMaterial.colorBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          width: Get.width,
          height: 50,
          child: Center(
            child: Text(
              "Kembali Ke Beranda",
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontSemiBold,
                color: AllMaterial.colorWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonAbsen extends StatelessWidget {
  const ButtonAbsen({
    super.key,
    required this.nama,
    required this.svg,
    required this.tekan,
  });

  final String nama;
  final String svg;
  final void Function() tekan;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 250, 250, 250),
      borderRadius: BorderRadius.circular(15),
      shadowColor: AllMaterial.colorBlack,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: tekan,
        child: Ink(
          child: Container(
            width: Get.width / 2.5,
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AllMaterial.colorBlue,
                  ),
                  child: SvgPicture.asset(svg),
                ),
                const SizedBox(height: 15),
                Text(
                  nama,
                  style: AllMaterial.montSerrat(
                    fontWeight: AllMaterial.fontSemiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
