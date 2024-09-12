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
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                color: AllMaterial.colorBlue,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/logo/opacity.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      "CV. GLOBAL VINTAGE NUMERATION",
                      style: AllMaterial.montSerrat(
                        fontWeight: AllMaterial.fontBold,
                        fontSize: 15,
                        color: AllMaterial.colorWhite,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Jam Masuk : 08:10 AM",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorWhite,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          "|",
                          style: AllMaterial.montSerrat(
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Jam Keluar : 16:50 AM",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorWhite,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.28,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                height: Get.height,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
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

class ButtonAbsen extends StatelessWidget {
  ButtonAbsen({
    super.key,
    required this.nama,
    required this.svg,
    required this.tekan,
  });

  String nama;
  String svg;
  void Function() tekan;
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
            width: 150,
            decoration: const BoxDecoration(
                // boxShadow: [
                //   AllMaterial.boxShadow,
                // ],
                ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: AllMaterial.colorBlue,
                  ),
                  child: SvgPicture.asset(
                    svg,
                  ),
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
