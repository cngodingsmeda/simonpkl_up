import 'package:badges/badges.dart' as badges;
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
import 'package:simon_pkl/app/modules/siswa/pilih_dudi_siswa/controllers/pilih_dudi_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/pilih_dudi_siswa/views/pilih_dudi_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/views/pilihan_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';

import '../controllers/homepage_siswa_controller.dart';

class HomepageSiswaView extends GetView<HomepageSiswaController> {
  const HomepageSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomepageSiswaController());
    var profController = Get.put(ProfileSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: controller.getNotifUnread(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                return Container(
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
                                "NISN : ${profController.profil.value!.nis}",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontRegular,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => (controller.readCount.value == 0)
                                ? IconButton(
                                    tooltip: "Notifikasi",
                                    style: const ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        AllMaterial.colorBlue,
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.to(() => const NotifikasiSiswaView());
                                    },
                                    icon: const Icon(
                                      Icons.notifications,
                                      color: AllMaterial.colorWhite,
                                    ),
                                  )
                                : badges.Badge(
                                    position: badges.BadgePosition.topEnd(),
                                    badgeContent: Text(
                                      controller.readCount.value.toString(),
                                      style: AllMaterial.montSerrat(
                                        color: AllMaterial.colorWhite,
                                      ),
                                    ),
                                    child: IconButton(
                                      tooltip: "Notifikasi",
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AllMaterial.colorBlue,
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.to(
                                            () => const NotifikasiSiswaView());
                                      },
                                      icon: const Icon(
                                        Icons.notifications,
                                        color: AllMaterial.colorWhite,
                                      ),
                                    ),
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
                          () => (HomepageSiswaController.statusPkl.value ==
                                  "belum_pkl")
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
                                        var pilihDudi =
                                            Get.put(PilihDudiSiswaController());
                                        pilihDudi.fetchDudiList();
                                        Get.to(
                                            () => const PilihDudiSiswaView());
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
                              : (HomepageSiswaController.statusPkl.value ==
                                      "menunggu")
                                  ? FutureBuilder(
                                      future:
                                          (profController.profil.value != null)
                                              ? controller.getLastAjuanPkl()
                                              : Future.delayed(
                                                  const Duration(seconds: 1),
                                                ),
                                      builder: (context, snapshot) {
                                        var ajuanPkl =
                                            controller.ajuanPkl.value;
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AllMaterial.colorBlue,
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Ajuan Saya",
                                              style: AllMaterial.montSerrat(
                                                color: AllMaterial.colorWhite,
                                                fontWeight:
                                                    AllMaterial.fontSemiBold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.cases_outlined,
                                                        color: AllMaterial
                                                            .colorWhite,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Expanded(
                                                        child: Text(
                                                          ajuanPkl!.dudi
                                                              .namaInstansiPerusahaan,
                                                          style: AllMaterial
                                                              .montSerrat(
                                                            color: AllMaterial
                                                                .colorWhite,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
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
                                                        color: AllMaterial
                                                            .colorWhite,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Expanded(
                                                        child: Text(
                                                          ajuanPkl
                                                              .dudi.noTelepon,
                                                          style: AllMaterial
                                                              .montSerrat(
                                                            color: AllMaterial
                                                                .colorWhite,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
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
                                                        color: AllMaterial
                                                            .colorWhite,
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Expanded(
                                                        child: Text(
                                                          AllMaterial
                                                              .setiapHurufPertama(
                                                                  "${ajuanPkl.dudi.alamat.detailTempat}, ${ajuanPkl.dudi.alamat.desa}, ${ajuanPkl.dudi.alamat.kecamatan}, ${ajuanPkl.dudi.alamat.kabupaten}, ${ajuanPkl.dudi.alamat.kabupaten}, ${ajuanPkl.dudi.alamat.provinsi}"),
                                                          style: AllMaterial
                                                              .montSerrat(
                                                            color: AllMaterial
                                                                .colorWhite,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                        middleTextStyle:
                                                            AllMaterial
                                                                .montSerrat(),
                                                        backgroundColor:
                                                            AllMaterial
                                                                .colorWhite,
                                                        radius: 10,
                                                        buttonColor: AllMaterial
                                                            .colorBlue,
                                                        titleStyle: AllMaterial
                                                            .montSerrat(
                                                          fontWeight:
                                                              AllMaterial
                                                                  .fontMedium,
                                                        ),
                                                        title: "Konfirmasi",
                                                        middleText:
                                                            "Apakah Anda yakin ingin membatalkan ajuan PKL?",
                                                        onConfirm: () {
                                                          Get.back();
                                                          controller
                                                              .batalkanPkl(
                                                            ajuanPkl.id,
                                                          );
                                                        },
                                                        textCancel: "Batalkan",
                                                        cancelTextColor:
                                                            AllMaterial
                                                                .colorBlue,
                                                        textConfirm:
                                                            "Konfirmasi",
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shadowColor:
                                                          Colors.transparent,
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
                                                          color: AllMaterial
                                                              .colorWhite,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Batalkan",
                                                      style: AllMaterial
                                                          .montSerrat(
                                                        color: AllMaterial
                                                            .colorWhite,
                                                        fontWeight: AllMaterial
                                                            .fontMedium,
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.to(
                                                        () =>
                                                            const AjuanSiswaView(),
                                                        arguments: ajuanPkl.id,
                                                      );
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shadowColor:
                                                          Colors.transparent,
                                                      backgroundColor:
                                                          AllMaterial
                                                              .colorWhite,
                                                      elevation: 0,
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(16),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      "Cek Status",
                                                      style: AllMaterial
                                                          .montSerrat(
                                                        color: AllMaterial
                                                            .colorBlue,
                                                        fontWeight: AllMaterial
                                                            .fontMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      })
                                  : (HomepageSiswaController.statusPkl.value ==
                                          "sudah_pkl")
                                      ? GestureDetector(
                                          onTap: () {
                                            // controller.status.value = "belum pkl";
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Tempat PKL Saya",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorWhite,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.cases_outlined,
                                                          color: AllMaterial
                                                              .colorWhite,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Text(
                                                            "CV. Global Vintage Numeration 313",
                                                            style: AllMaterial
                                                                .montSerrat(
                                                              color: AllMaterial
                                                                  .colorWhite,
                                                              fontWeight:
                                                                  AllMaterial
                                                                      .fontMedium,
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
                                                          color: AllMaterial
                                                              .colorWhite,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Text(
                                                            "+62 867654321",
                                                            style: AllMaterial
                                                                .montSerrat(
                                                              color: AllMaterial
                                                                  .colorWhite,
                                                              fontWeight:
                                                                  AllMaterial
                                                                      .fontMedium,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .pin_drop_outlined,
                                                          color: AllMaterial
                                                              .colorWhite,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Text(
                                                            "Jl. Lorem ipsum, Dolor sit, No. 313",
                                                            style: AllMaterial
                                                                .montSerrat(
                                                              color: AllMaterial
                                                                  .colorWhite,
                                                              fontWeight:
                                                                  AllMaterial
                                                                      .fontMedium,
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Flexible(
                                                      child:
                                                          ElevatedButton.icon(
                                                        icon: SvgPicture.asset(
                                                          "assets/icons/laporan.svg",
                                                          height: 30,
                                                        ),
                                                        onPressed: () {
                                                          Get.to(() =>
                                                              const LaporanSiswaView());
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shadowColor: Colors
                                                              .transparent,
                                                          backgroundColor:
                                                              AllMaterial
                                                                  .colorBlue,
                                                          elevation: 0,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  16),
                                                            ),
                                                            side: BorderSide(
                                                              color: AllMaterial
                                                                  .colorWhite,
                                                            ),
                                                          ),
                                                        ),
                                                        label: Text(
                                                          "Laporan",
                                                          style: AllMaterial
                                                              .montSerrat(
                                                            color: AllMaterial
                                                                .colorWhite,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child:
                                                          ElevatedButton.icon(
                                                        icon: const Icon(
                                                          Icons.fingerprint,
                                                          color: AllMaterial
                                                              .colorBlue,
                                                        ),
                                                        onPressed: () {
                                                          Get.to(
                                                            () =>
                                                                const PilihanAbsenSiswaView(),
                                                          );
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shadowColor: Colors
                                                              .transparent,
                                                          backgroundColor:
                                                              AllMaterial
                                                                  .colorWhite,
                                                          elevation: 0,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  16),
                                                            ),
                                                          ),
                                                        ),
                                                        label: Text(
                                                          "Absensi",
                                                          style: AllMaterial
                                                              .montSerrat(
                                                            color: AllMaterial
                                                                .colorBlue,
                                                            fontWeight:
                                                                AllMaterial
                                                                    .fontMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                        ),
                      ),
                      Obx(
                        () => profController.profil.value!.status == "sudah_pkl"
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
                                      Get.to(
                                          () => const HistoriAbsenSiswaView());
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Histori Absen",
                                          style: AllMaterial.montSerrat(
                                            color: AllMaterial.colorBlack,
                                            fontWeight:
                                                AllMaterial.fontSemiBold,
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
                                        onTap: () => Get.to(() =>
                                            const DetilHistoriAbsenSiswaView()),
                                        tanggal: "Sabtu, 24 Agustus 2024",
                                        icon: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        keterangan: "Hadir",
                                      ),
                                      CardWidget(
                                        onTap: () => Get.to(() =>
                                            const DetilHistoriAbsenSiswaView()),
                                        tanggal: "Sabtu, 24 Agustus 2024",
                                        icon: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        keterangan: "Hadir",
                                      ),
                                      CardWidget(
                                        onTap: () => Get.to(() =>
                                            const DetilHistoriAbsenSiswaView()),
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
                );
              }),
        ),
      ),
    );
  }
}
