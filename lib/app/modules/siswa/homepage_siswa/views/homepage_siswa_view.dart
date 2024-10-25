// ignore_for_file: deprecated_member_use

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/views/ajuan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/batalkan_pkl_siswa/views/batalkan_pkl_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/controllers/detil_histori_absen_siswa_controller.dart';
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
    if (HomepageSiswaController.statusPkl.value == "sudah_pkl") {
      controller.getAbsenTigaHari();
    }

    if (HomepageSiswaController.statusPkl.value == "menunggu") {
      controller.getLastAjuanPkl();
    }
    controller.getNotifUnread();
    var profController = Get.put(ProfileSiswaController());
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
                        Obx(
                          () => Text(
                            "NISN : ${profController.profil.value?.nis ?? ""}",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontRegular,
                            ),
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
                                  Get.to(() => const NotifikasiSiswaView());
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
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AllMaterial.colorWhite,
                                  elevation: 0,
                                  foregroundColor: AllMaterial.colorBlue,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: () {
                                  var pilihDudi =
                                      Get.put(PilihDudiSiswaController());
                                  pilihDudi.fetchDudiList();
                                  Get.to(() => const PilihDudiSiswaView());
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: AllMaterial.colorBlue,
                                ),
                                label: Text(
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
                                future: (profController.profil.value != null)
                                    ? controller.getLastAjuanPkl()
                                    : Future.delayed(
                                        const Duration(seconds: 1),
                                      ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: CircularProgressIndicator(
                                            color: AllMaterial.colorBlue,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  var ajuanPkl = controller.ajuanPkl.value;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    ajuanPkl?.dudi
                                                            .namaInstansiPerusahaan ??
                                                        'No Instansi Perusahaan',
                                                    style:
                                                        AllMaterial.montSerrat(
                                                      color: AllMaterial
                                                          .colorWhite,
                                                      fontWeight: AllMaterial
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
                                                  color: AllMaterial.colorWhite,
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    ajuanPkl!.dudi.noTelepon,
                                                    style:
                                                        AllMaterial.montSerrat(
                                                      color: AllMaterial
                                                          .colorWhite,
                                                      fontWeight: AllMaterial
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
                                                  color: AllMaterial.colorWhite,
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Text(
                                                    AllMaterial.setiapHurufPertama(
                                                        "${ajuanPkl.dudi.alamat.detailTempat}, ${ajuanPkl.dudi.alamat.desa}, ${ajuanPkl.dudi.alamat.kecamatan}, ${ajuanPkl.dudi.alamat.kabupaten}, ${ajuanPkl.dudi.alamat.kabupaten}, ${ajuanPkl.dudi.alamat.provinsi}"),
                                                    style:
                                                        AllMaterial.montSerrat(
                                                      color: AllMaterial
                                                          .colorWhite,
                                                      fontWeight: AllMaterial
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
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Get.to(
                                                    () =>
                                                        const BatalkanPklSiswaView(),
                                                    arguments: {
                                                      "id": ajuanPkl.id,
                                                      "instansi": ajuanPkl.dudi
                                                          .namaInstansiPerusahaan
                                                    });
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
                                                  () => const AjuanSiswaView(),
                                                  arguments: ajuanPkl.id,
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
                                  );
                                })
                            : (HomepageSiswaController.statusPkl.value ==
                                    "sudah_pkl")
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tempat PKL Saya",
                                        style: AllMaterial.montSerrat(
                                          color: AllMaterial.colorWhite,
                                          fontWeight: AllMaterial.fontSemiBold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.cases_outlined,
                                                    color:
                                                        AllMaterial.colorWhite,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      profController
                                                              .profil
                                                              .value
                                                              ?.dudi
                                                              ?.namaInstansiPerusahaan ??
                                                          "",
                                                      style: AllMaterial
                                                          .montSerrat(
                                                        color: AllMaterial
                                                            .colorWhite,
                                                        fontWeight: AllMaterial
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
                                                    color:
                                                        AllMaterial.colorWhite,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Text(
                                                      profController
                                                              .profil
                                                              .value
                                                              ?.noTelepon ??
                                                          "",
                                                      style: AllMaterial
                                                          .montSerrat(
                                                        color: AllMaterial
                                                            .colorWhite,
                                                        fontWeight: AllMaterial
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
                                                    color:
                                                        AllMaterial.colorWhite,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: Obx(
                                                      () => Text(
                                                        (profController.profil
                                                                    .value ==
                                                                null)
                                                            ? ""
                                                            : AllMaterial
                                                                .setiapHurufPertama(
                                                                    "${profController.profil.value?.dudi?.alamat?.detailTempat ?? ""}, ${profController.profil.value?.dudi?.alamat?.desa ?? ""}, ${profController.profil.value?.dudi?.alamat?.kecamatan ?? ""}, ${profController.profil.value?.dudi?.alamat?.kabupaten ?? ""}, ${profController.profil.value?.dudi?.alamat?.kabupaten ?? ""}, ${profController.profil.value?.dudi?.alamat?.provinsi ?? ""}"),
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
                                                ],
                                              ),
                                            ],
                                          ),
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
                                                label: Text(
                                                  "Laporan",
                                                  style: AllMaterial.montSerrat(
                                                    color:
                                                        AllMaterial.colorWhite,
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
                                                  shadowColor:
                                                      Colors.transparent,
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
                                                    color:
                                                        AllMaterial.colorBlue,
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
                                  )
                                : const SizedBox.shrink(),
                  ),
                ),
                Obx(
                  () => profController.profil.value?.status == "sudah_pkl"
                      ? Column(
                          children: [
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
                            Obx(() {
                              if (controller.absenTigaHari.isEmpty) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 25),
                                    Center(
                                      child: Text(
                                        "Belum ada histori absen",
                                        style: AllMaterial.montSerrat(),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.absenTigaHari.length,
                                  itemBuilder: (context, index) {
                                    var absen = controller.absenTigaHari[index];
                                    print(absen.status);
                                    return (absen.status!.contains("tidak"))
                                        ? const SizedBox.shrink()
                                        : CardWidget(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AllMaterial.cusDialog(
                                                    topTitle: "Absen Harian",
                                                    path:
                                                        "assets/icons/laporan.svg",
                                                    dateTime:
                                                        AllMaterial.ubahHari(
                                                      absen.tanggal!
                                                          .toIso8601String(),
                                                    ),
                                                    onTap1: () {
                                                      var absensi = Get.put(
                                                          DetilHistoriAbsenSiswaControllr());
                                                      absensi.getDetilAbsenById(
                                                          absen.id!.toInt(),
                                                          "masuk",
                                                          absen.status!);
                                                    },
                                                    onTap2: () {
                                                      var absensi = Get.put(
                                                          DetilHistoriAbsenSiswaControllr());
                                                      if (absen
                                                              .statusAbsenPulang !=
                                                          null) {
                                                        absensi
                                                            .getDetilAbsenById(
                                                                absen.id!
                                                                    .toInt(),
                                                                "pulang",
                                                                absen.status!);
                                                      } else {
                                                        Get.back();
                                                        AllMaterial.messageScaffold(
                                                            title:
                                                                "Absen Pulang tidak ditemukan!",
                                                            context: context);
                                                      }
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            tanggal: AllMaterial.ubahHari(absen
                                                .tanggal!
                                                .toIso8601String()),
                                            icon: (absen.status!
                                                    .contains("hadir"))
                                                ? const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green,
                                                  )
                                                : (absen.status!
                                                        .contains("tidak"))
                                                    ? const Icon(
                                                        Icons.cancel_sharp,
                                                        color: Colors.red,
                                                      )
                                                    : (absen.status!.contains(
                                                                "sakit") ||
                                                            absen.status!
                                                                .contains(
                                                                    "izin"))
                                                        ? const Icon(
                                                            Icons.remove_circle,
                                                            color:
                                                                Colors.yellow,
                                                          )
                                                        : const Icon(
                                                            Icons.info_rounded,
                                                            color:
                                                                Colors.yellow,
                                                          ),
                                            keterangan:
                                                (absen.status!.contains("_"))
                                                    ? AllMaterial
                                                        .setiapHurufPertama(
                                                            absen.status!
                                                                .split('_')
                                                                .join(' '))
                                                    : AllMaterial
                                                        .setiapHurufPertama(
                                                        absen.status,
                                                      ),
                                          );
                                  },
                                );
                              }
                            })
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
