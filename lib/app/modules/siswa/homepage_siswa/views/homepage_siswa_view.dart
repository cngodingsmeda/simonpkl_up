import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/views/ajuan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/views/detil_histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/views/histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_siswa/views/laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/notifikasi_siswa/views/notifikasi_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilih_dudi_siswa/views/pilih_dudi_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/views/pilihan_absen_siswa_view.dart';

import '../controllers/homepage_siswa_controller.dart';

class HomepageSiswaView extends GetView<HomepageSiswaController> {
  const HomepageSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomepageSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang, Siswa",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "NISN : 21414125125",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontRegular,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      tooltip: "Notifikasi",
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AllMaterial.colorBlue),
                      ),
                      onPressed: () {
                        Get.to(() => const NotifikasiSiswaView());
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: AllMaterial.colorWhite,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(25),
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AllMaterial.colorBlue,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/logo/opacity.png"),
                    ),
                  ),
                  child: Obx(
                    () => (controller.statusPKL() == "belum pkl")
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Belum ada instansi yang dipilih",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontSemiBold,
                                  color: AllMaterial.colorWhite,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AllMaterial.colorWhite,
                                  fixedSize: const Size.fromWidth(85),
                                  elevation: 0,
                                  foregroundColor: AllMaterial.colorBlue,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  Get.to(() => const PilihDudiSiswaView());
                                },
                                child: Text(
                                  "Pilih",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : (controller.statusPKL() == "menunggu pkl")
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ajuan Saya",
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorWhite,
                                      fontWeight: AllMaterial.fontSemiBold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.cases_outlined,
                                              color: AllMaterial.colorWhite,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                "CV. Global Vintage Numeration 313",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorWhite,
                                                  fontWeight:
                                                      AllMaterial.fontMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.phone_outlined,
                                              color: AllMaterial.colorWhite,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                "+62 867654321",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorWhite,
                                                  fontWeight:
                                                      AllMaterial.fontMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.pin_drop_outlined,
                                              color: AllMaterial.colorWhite,
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                "Jl. Lorem ipsum, Dolor sit, No. 313",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorWhite,
                                                  fontWeight:
                                                      AllMaterial.fontMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              middleTextStyle:
                                                  AllMaterial.montSerrat(),
                                              backgroundColor:
                                                  AllMaterial.colorWhite,
                                              radius: 10,
                                              buttonColor:
                                                  AllMaterial.colorBlue,
                                              titleStyle:
                                                  AllMaterial.montSerrat(
                                                fontWeight:
                                                    AllMaterial.fontMedium,
                                              ),
                                              title: "Konfirmasi",
                                              middleText:
                                                  "Apakah Anda yakin ingin membatalkan ajuan PKL?",
                                              onConfirm: () {
                                                Get.back();
                                                controller.status.value =
                                                    "sedang pkl";
                                              },
                                              textCancel: "Batalkan",
                                              cancelTextColor:
                                                  AllMaterial.colorBlue,
                                              textConfirm: "Konfirmasi",
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            backgroundColor:
                                                AllMaterial.colorBlue,
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              side: BorderSide(
                                                color: AllMaterial.colorWhite,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Batalkan",
                                            style: AllMaterial.montSerrat(
                                              color: AllMaterial.colorWhite,
                                              fontWeight:
                                                  AllMaterial.fontMedium,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.to(
                                                () => const AjuanSiswaView());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.transparent,
                                            backgroundColor:
                                                AllMaterial.colorWhite,
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Cek Status",
                                            style: AllMaterial.montSerrat(
                                              color: AllMaterial.colorBlue,
                                              fontWeight:
                                                  AllMaterial.fontMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : GestureDetector(
                                onTap: () {
                                  controller.status.value = "belum pkl";
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tempat PKL Saya",
                                      style: AllMaterial.montSerrat(
                                        color: AllMaterial.colorWhite,
                                        fontWeight: AllMaterial.fontSemiBold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.cases_outlined,
                                                color: AllMaterial.colorWhite,
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  "CV. Global Vintage Numeration 313",
                                                  style: AllMaterial.montSerrat(
                                                    color:
                                                        AllMaterial.colorWhite,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.phone_outlined,
                                                color: AllMaterial.colorWhite,
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  "+62 867654321",
                                                  style: AllMaterial.montSerrat(
                                                    color:
                                                        AllMaterial.colorWhite,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.pin_drop_outlined,
                                                color: AllMaterial.colorWhite,
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Text(
                                                  "Jl. Lorem ipsum, Dolor sit, No. 313",
                                                  style: AllMaterial.montSerrat(
                                                    color:
                                                        AllMaterial.colorWhite,
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      width: Get.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Flexible(
                                            child: ElevatedButton.icon(
                                              icon: SvgPicture.asset(
                                                "assets/icons/laporan.svg",
                                                height: 30,
                                              ),
                                              onPressed: () {
                                                Get.to(() =>
                                                    const LaporanSiswaView());
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shadowColor: Colors.transparent,
                                                backgroundColor:
                                                    AllMaterial.colorBlue,
                                                elevation: 0,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(16),
                                                  ),
                                                  side: BorderSide(
                                                    color:
                                                        AllMaterial.colorWhite,
                                                  ),
                                                ),
                                              ),
                                              label: Text(
                                                "Laporan",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorWhite,
                                                  fontWeight:
                                                      AllMaterial.fontMedium,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: ElevatedButton.icon(
                                              icon: const Icon(
                                                Icons.fingerprint,
                                                color: AllMaterial.colorBlue,
                                              ),
                                              onPressed: () {
                                                Get.to(
                                                  () =>
                                                      const PilihanAbsenSiswaView(),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shadowColor: Colors.transparent,
                                                backgroundColor:
                                                    AllMaterial.colorWhite,
                                                elevation: 0,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(16),
                                                  ),
                                                ),
                                              ),
                                              label: Text(
                                                "Absensi",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorBlue,
                                                  fontWeight:
                                                      AllMaterial.fontMedium,
                                                ),
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
                ),
                Obx(
                  () => controller.statusPKL() == "sedang pkl"
                      ? Column(
                          children: [
                            const SizedBox(height: 10),
                            // SizedBox(
                            //   width: Get.width,
                            //   child: ElevatedButton.icon(
                            //     onPressed: () {
                            //       // absen
                            //       Get.to(() => const PilihanAbsenSiswaView());
                            //     },
                            //     icon: const Icon(
                            //       Icons.fingerprint,
                            //       color: AllMaterial.colorBlue,
                            //     ),
                            //     label: Text(
                            //       "Absen Harian",
                            //       style: AllMaterial.montSerrat(
                            //         color: AllMaterial.colorBlue,
                            //         fontWeight: AllMaterial.fontMedium,
                            //       ),
                            //     ),
                            //     style: ElevatedButton.styleFrom(
                            //       foregroundColor: AllMaterial.colorBlue,
                            //       backgroundColor: AllMaterial.colorWhite,
                            //       padding: const EdgeInsets.symmetric(
                            //         horizontal: 24,
                            //         vertical: 12,
                            //       ),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(30),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 30),
                            InkWell(
                              onTap: () {
                                Get.to(() => const HistoriAbsenSiswaView());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Histori Absen",
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorBlack,
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: AllMaterial.colorBlack,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                CardWidget(
                                  onTap: () => Get.to(
                                      () => const DetilHistoriAbsenSiswaView()),
                                  tanggal: "Sabtu, 24 Agustus 2024",
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  keterangan: "Hadir",
                                ),
                                CardWidget(
                                  onTap: () => Get.to(
                                      () => const DetilHistoriAbsenSiswaView()),
                                  tanggal: "Sabtu, 24 Agustus 2024",
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  keterangan: "Hadir",
                                ),
                                CardWidget(
                                  onTap: () => Get.to(
                                      () => const DetilHistoriAbsenSiswaView()),
                                  tanggal: "Sabtu, 24 Agustus 2024",
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                  keterangan: "Hadir",
                                ),
                                const SizedBox(height: 60),
                              ],
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
