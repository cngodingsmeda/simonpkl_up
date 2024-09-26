import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/laporan_siswa_guru/views/laporan_siswa_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/views/pilihan_absen_siswa_view.dart';

import '../controllers/monitoring_guru_controller.dart';

class MonitoringGuruView extends GetView<MonitoringGuruController> {
  const MonitoringGuruView({super.key});
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
                      "Monitoring PKL SMKN 2 Mataram",
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
                          "Guru Pembimbing : Gheral Deva S.pD",
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
                        nama: "Laporan Siswa",
                        svg: "assets/icons/laporan-file.svg",
                        tekan: () {
                          Get.to(() => const LaporanSiswaGuruView(), arguments: "Siswa");
                          AllMaterial.box.write("isKendala", false);
        
                        },
                      ),
                      const SizedBox(width: 12),
                      ButtonAbsen(
                        nama: "Kendala Siswa",
                        svg: "assets/icons/kendala-toa.svg",
                        tekan: () {
                          Get.to(() => const LaporanSiswaGuruView(), arguments: "Siswa");
                          AllMaterial.box.write("isKendala", true);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonAbsen(
                        nama: "Laporan Dudi",
                        svg: "assets/icons/laporan-file.svg",
                        tekan: () {
                          Get.to(() => const LaporanSiswaGuruView(), arguments: "Dudi");
                          AllMaterial.box.write("isKendala", false);
                        },
                      ),
                      const SizedBox(width: 12),
                      ButtonAbsen(
                        nama: "Kendala Dudi",
                        svg: "assets/icons/kendala-toa.svg",
                        tekan: () {
                          Get.to(() => const LaporanSiswaGuruView(), arguments: "Dudi");
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
