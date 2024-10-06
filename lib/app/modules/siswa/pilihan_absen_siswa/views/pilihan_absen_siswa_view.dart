import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/absen_abnormal_siswa/views/absen_abnormal_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/absen_normal_siswa/views/absen_normal_siswa_view.dart';

import '../controllers/pilihan_absen_siswa_controller.dart';

class PilihanAbsenSiswaView extends GetView<PilihanAbsenSiswaController> {
  const PilihanAbsenSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PilihanAbsenSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        if (controller.isLoading.value == false) {
          return const Center(
            child: CircularProgressIndicator(
              color: AllMaterial.colorBlue,
            ),
          );
        }
        if (controller.isWithinRadius.isFalse) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (controller.isWithinRadius.isFalse)
                        ? controller.msg.value
                        : "Anda tidak berada dalam radius yang ditentukan.",
                    textAlign: TextAlign.center,
                    style: AllMaterial.montSerrat(
                        fontWeight: AllMaterial.fontSemiBold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: AllMaterial.colorBlue,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                    child: Text(
                      "Kembali",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final instansi = controller.jadwalAbsenSiswa.value;
        if (instansi != null) {
          return Center(
            child: Text(
              "Data Instansi tidak tersedia.",
              style:
                  AllMaterial.montSerrat(fontWeight: AllMaterial.fontSemiBold),
            ),
          );
        }
        return SingleChildScrollView(
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
                        "CV. Global Vintage Numeration",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                // "Jam Masuk : ${instansi.jamMasuk}",
                                "Jam Masuk : 08:25-11:00",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorWhite,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Text(
                              " | ",
                              style: AllMaterial.montSerrat(
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontSemiBold,
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                // "Jam Keluar : ${instansi.jamKeluar}",
                                "Jam Keluar : 18:00-20:00",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorWhite,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
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
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.04),
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
                    Text(
                      "Disarankan untuk : Absen Masuk",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorGrey,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonAbsen(
                          nama: "Absen Masuk",
                          svg: "assets/icons/absen_masuk.svg",
                          tekan: () {
                            Get.to(() => const AbsenNormalSiswaView());
                          },
                        ),
                        const SizedBox(width: 12),
                        ButtonAbsen(
                          nama: "Absen Keluar",
                          svg: "assets/icons/absen_keluar.svg",
                          tekan: () {
                            Get.to(() => const AbsenNormalSiswaView());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonAbsen(
                          nama: "Absen Telat",
                          svg: "assets/icons/absen_telat.svg",
                          tekan: () {
                            Get.to(() => const AbsenAbnormalSiswaView());
                          },
                        ),
                        const SizedBox(width: 12),
                        ButtonAbsen(
                          nama: "Absen Izin",
                          svg: "assets/icons/absen_izin.svg",
                          tekan: () {
                            Get.to(() => const AbsenAbnormalSiswaView());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: controller.isWithinRadius.isFalse
          ? const SizedBox.shrink()
          : GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
