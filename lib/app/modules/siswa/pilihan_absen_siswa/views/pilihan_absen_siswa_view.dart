import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/model/model_siswa/jadwal_absen_siswa.dart';
import 'package:simon_pkl/app/modules/siswa/absen_abnormal_siswa/views/absen_abnormal_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/absen_normal_siswa/views/absen_normal_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/controllers/pilihan_absen_siswa_controller.dart';

class PilihanAbsenSiswaView extends GetView<PilihanAbsenSiswaController> {
  const PilihanAbsenSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PilihanAbsenSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: AllMaterial.colorBlue,
                ),
              ),
            ],
          );
        }

        // Cek jika tidak dalam radius
        if (controller.isWithinRadius.isFalse ||
            controller.jadwalAbsenSiswa.value == null) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Anda tidak berada dalam radius yang ditentukan.",
                    textAlign: TextAlign.center,
                    style: AllMaterial.montSerrat(
                        fontWeight: AllMaterial.fontSemiBold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AllMaterial.colorBlue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
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
                      const SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () async {
                          controller.isWithinRadius.value = true;
                          controller.absenLuarRadius.value = true;
                          if (controller.isWithinRadius.isTrue) {
                            await controller.getAllJadwalAbsen();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AllMaterial.colorWhite,
                          side: const BorderSide(color: AllMaterial.colorBlue),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                        child: Text(
                          "Lanjutkan",
                          style: AllMaterial.montSerrat(
                            color: AllMaterial.colorBlue,
                            fontWeight: AllMaterial.fontMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        var hariIni =
            DateFormat('EEEE', 'id_ID').format(DateTime.now()).toLowerCase();
        JadwalAbsenSiswa? instansi = controller.jadwalAbsenSiswa.value;

        if (instansi!.data!.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AllMaterial.hurufPertama(controller.msg.value),
                    textAlign: TextAlign.center,
                    style: AllMaterial.montSerrat(
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          Hari? jadwalHariIni;
          if (instansi.data!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Tidak ada jadwal absen untuk hari ini : ${AllMaterial.hurufPertama(controller.hariIni)}.",
                      style: AllMaterial.montSerrat(
                        fontWeight: AllMaterial.fontSemiBold,
                        color: AllMaterial.colorGrey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            jadwalHariIni = instansi.data![0].hari!.firstWhere(
              (jadwal) => jadwal.hari.toString().toLowerCase() == hariIni,
              orElse: () => Hari(
                id: 0,
                hari: "",
                batasAbsenMasuk: "",
                batasAbsenPulang: "",
              ),
            );
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
                        Text(
                          controller.hariIni,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 18,
                            color: AllMaterial.colorWhite,
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: (jadwalHariIni.batasAbsenMasuk!.isEmpty ||
                                    jadwalHariIni.batasAbsenPulang!.isEmpty)
                                ? Text(
                                    "Tidak ada jadwal absen untuk hari ini",
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontSemiBold,
                                      color: AllMaterial.colorWhite,
                                      fontSize: 13,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Batas Absen Masuk : ${jadwalHariIni.batasAbsenMasuk != null ? AllMaterial.formatJam(jadwalHariIni.batasAbsenMasuk!) : 'Belum Ditentukan'}",
                                          style: AllMaterial.montSerrat(
                                            fontWeight:
                                                AllMaterial.fontSemiBold,
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
                                          "Batas Absen Pulang : ${jadwalHariIni.batasAbsenPulang != null ? AllMaterial.formatJam(jadwalHariIni.batasAbsenPulang!) : 'Belum Ditentukan'}",
                                          style: AllMaterial.montSerrat(
                                            fontWeight:
                                                AllMaterial.fontSemiBold,
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
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.04),
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
                        (controller.bisaAbsen.isTrue)
                            ? Text(
                                "Disarankan untuk : Absen ${(controller.absenLuarRadius.isFalse) ? AllMaterial.setiapHurufPertama(controller.jenisAbsen.value) : AllMaterial.setiapHurufPertama("${controller.jenisAbsen.value}(Di luar radius)")}",
                                style: AllMaterial.montSerrat(
                                  color: AllMaterial.colorGrey,
                                  fontWeight: AllMaterial.fontSemiBold,
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonAbsen(
                              nama: "Absen Masuk",
                              svg: "assets/icons/absen_masuk.svg",
                              tekan: () {
                                if (controller.isMasuk.isTrue) {
                                  Get.to(
                                    () => const AbsenNormalSiswaView(),
                                    arguments: {
                                      "status": "masuk",
                                      "diLuarRadius":
                                          controller.absenLuarRadius.value,
                                      "latitude": controller.latitude.value,
                                      "longitude": controller.longitude.value
                                    },
                                  );
                                } else {
                                  AllMaterial.messageScaffold(
                                    title:
                                        "Absen Masuk tidak tersedia saat ini",
                                    context: context,
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 12),
                            ButtonAbsen(
                              nama: "Absen Pulang",
                              svg: "assets/icons/absen_keluar.svg",
                              tekan: () {
                                if (controller.isPulang.isTrue) {
                                  Get.to(
                                    () => const AbsenNormalSiswaView(),
                                    arguments: {
                                      "status": "pulang",
                                      "diLuarRadius":
                                          controller.absenLuarRadius.value,
                                      "latitude": controller.latitude.value,
                                      "longitude": controller.longitude.value
                                    },
                                  );
                                } else {
                                  AllMaterial.messageScaffold(
                                    title:
                                        "Absen Pulang tidak tersedia saat ini",
                                    context: context,
                                  );
                                }
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
                                  if (controller.isTelat.isTrue) {
                                    Get.to(
                                      () => const AbsenAbnormalSiswaView(),
                                      arguments: {
                                        "status": "telat",
                                        "latitude": controller.latitude.value,
                                        "longitude": controller.longitude.value
                                      },
                                    );
                                  } else {
                                    AllMaterial.messageScaffold(
                                      title:
                                          "Absen Telat tidak tersedia saat ini",
                                      context: context,
                                    );
                                  }
                                }),
                            const SizedBox(width: 12),
                            ButtonAbsen(
                              nama: "Absen Izin",
                              svg: "assets/icons/absen_izin.svg",
                              tekan: (controller.bisaAbsen.isTrue ||
                                      controller.jenisAbsen.value
                                          .contains("izin"))
                                  ? () {
                                      Get.to(
                                        () => const AbsenAbnormalSiswaView(),
                                        arguments: {
                                          "status": "izin",
                                          "latitude": controller.latitude.value,
                                          "longitude":
                                              controller.longitude.value
                                        },
                                      );
                                    }
                                  : () {
                                      AllMaterial.messageScaffold(
                                        title:
                                            "Absen Izin tidak tersedia saat ini",
                                        context: context,
                                      );
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
          }
        }
      }),
      bottomNavigationBar: Obx(() {
        if (controller.isLoading.isFalse && controller.isWithinRadius.isTrue) {
          return GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AllMaterial.colorBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 50,
              child: Center(
                child: Text(
                  "Kembali Ke Beranda",
                  style: AllMaterial.montSerrat(
                    color: AllMaterial.colorWhite,
                    fontSize: 16,
                    fontWeight: AllMaterial.fontSemiBold,
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}

class ButtonAbsen extends StatelessWidget {
  const ButtonAbsen({
    super.key,
    required this.nama,
    required this.svg,
    this.tekan,
  });

  final String nama;
  final String svg;
  final void Function()? tekan;

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
