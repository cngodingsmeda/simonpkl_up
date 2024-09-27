import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/views/laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/views/pilihan_absen_siswa_view.dart';

import '../controllers/skema_pkl_dudi_controller.dart';

class SkemaPklDudiView extends GetView<SkemaPklDudiController> {
  const SkemaPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
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
                      // instansi.nama,
                      "Skema PKL SMKN 2 Mataram",
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
                          "Pembimbing Dudi : Fauzan Azqa S.Kom",
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
              padding: const EdgeInsets.all(24),
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
                        nama: "Jadwal Absen",
                        svg: "assets/icons/buat-jadwal.svg",
                        tekan: () {
                          AllMaterial.messageScaffold(
                            title: "Fitur Sedang Digarap, Coming Soon",
                            context: context,
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      ButtonAbsen(
                        nama: "Form Rekrut",
                        svg: "assets/icons/buat-rekrut.svg",
                        tekan: () {
                          AllMaterial.messageScaffold(
                            title: "Fitur Sedang Digarap, Coming Soon",
                            context: context,
                          );
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
                          AllMaterial.box.write("isKendala", false);
                        },
                      ),
                      const SizedBox(width: 12),
                      ButtonAbsen(
                        nama: "Lapor Kendala",
                        svg: "assets/icons/kendala-toa.svg",
                        tekan: () {
                          Get.to(
                            () => const LaporanPklDudiView(),
                          );
                          AllMaterial.box.write("isKendala", true);
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
