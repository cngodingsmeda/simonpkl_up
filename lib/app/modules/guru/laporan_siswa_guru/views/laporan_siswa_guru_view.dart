import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_kendala_dudi_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_kendala_siswa_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_laporan_dudi_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_laporan_siswa_guru_model.dart';
import 'package:simon_pkl/app/modules/guru/detil_laporan_dudi_guru/controllers/detil_laporan_dudi_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/detil_laporan_dudi_guru/views/detil_laporan_dudi_guru_view.dart';
import 'package:simon_pkl/app/modules/guru/detil_laporan_siswa_guru/controllers/detil_laporan_siswa_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/detil_laporan_siswa_guru/views/detil_laporan_siswa_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/laporan_siswa_guru_controller.dart';

class LaporanSiswaGuruView extends GetView<LaporanSiswaGuruController> {
  const LaporanSiswaGuruView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKendala = AllMaterial.box.read("isKendala") ?? false;
    var role = Get.arguments;
    final controller = Get.put(LaporanSiswaGuruController());

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          isKendala ? "Kendala $role" : 'Laporan $role',
          style: AllMaterial.montSerrat(fontWeight: AllMaterial.fontSemiBold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Obx(
                () {
                  String role = Get.arguments;
                  if (role.toLowerCase().contains("siswa")) {
                    if ((isKendala)
                        ? controller.historiAllKendalaSiswaGuru.value == null ||
                            controller
                                .historiAllKendalaSiswaGuru.value!.data!.isEmpty
                        : controller.historiAllLaporanHarianSiswaGuru.value ==
                                null ||
                            controller.historiAllLaporanHarianSiswaGuru.value!
                                .data!.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "Tidak ada ${isKendala ? "Kendala $role" : 'Laporan $role'}",
                            style: AllMaterial.montSerrat(),
                          ),
                        ),
                      );
                    } else {
                      List<KendalaData> kendala = [];
                      List<LaporanData> laporan = [];
                      print("masuk ke if siswa");
                      return Expanded(
                        child: ListView.builder(
                          itemCount: isKendala
                              ? controller.historiAllKendalaSiswaGuru.value!
                                  .data!.length
                              : controller.historiAllLaporanHarianSiswaGuru
                                  .value!.data!.length,
                          itemBuilder: (context, dayIndex) {
                            var tanggal = isKendala
                                ? controller.historiAllKendalaSiswaGuru.value!
                                    .data!.keys
                                    .toList()[dayIndex]
                                : controller.historiAllLaporanHarianSiswaGuru
                                    .value!.data!.keys
                                    .toList()[dayIndex];

                            if (isKendala) {
                              kendala = controller.historiAllKendalaSiswaGuru
                                      .value!.data![tanggal] ??
                                  [];
                              if (kendala.isEmpty) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        AllMaterial.setiapHurufPertama(tanggal),
                                        style: AllMaterial.montSerrat(
                                          fontWeight: AllMaterial.fontMedium,
                                          color: AllMaterial.colorBlue,
                                        ),
                                      ),
                                    ),
                                    const Text("Tidak ada kendala",
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(height: 20),
                                  ],
                                );
                              }
                            } else {
                              laporan = controller
                                      .historiAllLaporanHarianSiswaGuru
                                      .value!
                                      .data![tanggal] ??
                                  [];
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    AllMaterial.setiapHurufPertama(tanggal),
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorBlue,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: isKendala
                                      ? kendala.length
                                      : laporan.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, cardIndex) {
                                    if (isKendala) {
                                      return CardWidget(
                                          tanggal: AllMaterial
                                              .setiapNamaHurufPertama(
                                                  kendala[cardIndex]
                                                          .siswa
                                                          ?.nama ??
                                                      ""),
                                          icon: const Icon(
                                            Icons.info_sharp,
                                            color: Colors.yellow,
                                          ),
                                          keterangan:
                                              kendala[cardIndex].deskripsi ??
                                                  "",
                                          onTap: () {
                                            DetilLaporanSiswaGuruController
                                                .isKendalaSiswa.value = true;
                                            Get.to(
                                              () =>
                                                  const DetilLaporanSiswaGuruView(),
                                              arguments: {
                                                "id": kendala[cardIndex].id,
                                              },
                                            );
                                          });
                                    } else {
                                      return CardWidget(
                                          tanggal: AllMaterial
                                              .setiapNamaHurufPertama(
                                                  laporan[cardIndex]
                                                          .siswa
                                                          ?.nama ??
                                                      ""),
                                          icon: const Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                          keterangan: AllMaterial
                                              .setiapHurufPertama(laporan[
                                                          cardIndex]
                                                      .rujukanKompetensiDasar ??
                                                  ""),
                                          onTap: () {
                                            DetilLaporanSiswaGuruController
                                                .isKendalaSiswa.value = false;
                                            print(
                                                "id laporan: ${laporan[cardIndex].siswa?.id}");
                                            Get.to(
                                              () =>
                                                  const DetilLaporanSiswaGuruView(),
                                              arguments: {
                                                "id": laporan[cardIndex].id
                                              },
                                            );
                                          });
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    if ((isKendala == true)
                        ? controller.historiAllKendalaDudiGuru.value == null ||
                            controller
                                .historiAllKendalaDudiGuru.value!.data!.isEmpty
                        : controller.historiAllLaporanHarianDudiGuru.value ==
                                null ||
                            controller.historiAllLaporanHarianDudiGuru.value!
                                .data!.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "Tidak ada ${isKendala ? "Kendala $role" : 'Laporan $role'}",
                            style: AllMaterial.montSerrat(),
                          ),
                        ),
                      );
                    } else {
                      print("masuk ke else histori");
                      List<DudiKendalaData> kendalaDudi = [];
                      List<LaporanDudiData> laporanDudi = [];
                      return Expanded(
                        child: ListView.builder(
                          itemCount: isKendala
                              ? controller
                                  .historiAllKendalaDudiGuru.value!.data!.length
                              : controller.historiAllLaporanHarianDudiGuru
                                  .value!.data!.length,
                          itemBuilder: (context, dayIndex) {
                            var tanggal = isKendala
                                ? controller
                                    .historiAllKendalaDudiGuru.value!.data!.keys
                                    .toList()[dayIndex]
                                : controller.historiAllLaporanHarianDudiGuru
                                    .value!.data!.keys
                                    .toList()[dayIndex];

                            if (isKendala) {
                              kendalaDudi = controller.historiAllKendalaDudiGuru
                                      .value?.data?[tanggal] ??
                                  [];
                            } else {
                              laporanDudi = controller
                                      .historiAllLaporanHarianDudiGuru
                                      .value
                                      ?.data?[tanggal] ??
                                  [];
                            }
                            print(
                                "${kendalaDudi.length} && ${laporanDudi.length}");
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    AllMaterial.setiapHurufPertama(tanggal),
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorBlue,
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  itemCount: isKendala
                                      ? kendalaDudi.length
                                      : laporanDudi.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, cardIndex) {
                                    if (isKendala == true) {
                                      return CardWidget(
                                        tanggal: AllMaterial
                                            .setiapNamaHurufPertama(kendalaDudi[
                                                        cardIndex]
                                                    .siswa
                                                    ?.dudi
                                                    ?.namaInstansiPerusahaan ??
                                                ""),
                                        icon: const Icon(
                                          Icons.info_sharp,
                                          color: Colors.yellow,
                                        ),
                                        keterangan:
                                            kendalaDudi[cardIndex].deskripsi ??
                                                "",
                                        onTap: () {
                                          DetilLaporanDudiGuruController
                                              .isKendalaDudi.value = true;
                                          Get.to(
                                            () =>
                                                const DetilLaporanDudiGuruView(),
                                            arguments: {
                                              "id": kendalaDudi[cardIndex].id
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      print("masuk ke else laporan dudi");
                                      return CardWidget(
                                        tanggal: AllMaterial
                                            .setiapNamaHurufPertama(laporanDudi[
                                                        cardIndex]
                                                    .dudi
                                                    ?.namaInstansiPerusahaan ??
                                                ""),
                                        icon: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        keterangan: AllMaterial
                                            .setiapHurufPertama(laporanDudi[
                                                        cardIndex]
                                                    .rujukanKompetensiDasar ??
                                                ""),
                                        onTap: () {
                                          DetilLaporanDudiGuruController
                                              .isKendalaDudi.value = false;
                                          Get.to(
                                            () =>
                                                const DetilLaporanDudiGuruView(),
                                            arguments: {
                                              "id": laporanDudi[cardIndex].id
                                            },
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          AllMaterial.box.remove("isKendala");
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
