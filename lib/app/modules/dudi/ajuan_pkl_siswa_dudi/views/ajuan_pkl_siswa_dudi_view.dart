// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/homepage_dudi/controllers/homepage_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/views/menunggu_verifikasi_pkl_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/verifikasi_dibatalkan_siswa_dudi/views/verifikasi_dibatalkan_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/verifikasi_selesai_pkl_siswa_dudi/views/verifikasi_selesai_pkl_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/ajuan_pkl_siswa_dudi_controller.dart';

class AjuanPklSiswaDudiView extends GetView<AjuanPklSiswaDudiController> {
  const AjuanPklSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AjuanPklSiswaDudiController());
    var homeC = Get.put(HomepageDudiController());
    var ajuanList = homeC.pengajuanPKL.value!.data!
        .where(
          (element) => element.status == "proses",
        )
        .toList();
    var dibatalkanList = homeC.pengajuanPKL.value!.data!
        .where(
          (element) => element.status == "dibatalkan",
        )
        .toList();
    var diterimaList = homeC.pengajuanPKL.value!.data!
        .where(
          (element) => element.status == "diterima",
        )
        .toList();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Ajuan PKL',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: (ajuanList.isEmpty &&
              diterimaList.isEmpty &&
              dibatalkanList.isEmpty)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    "Belum ada ajuan pkl",
                    style: AllMaterial.montSerrat(),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    // Expanded 1
                    (ajuanList.isEmpty)
                        ? const SizedBox.shrink()
                        : Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    controller.stringTitle[0],
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorBlue,
                                    ),
                                  ),
                                ),
                                ...List.generate(ajuanList.length, (index) {
                                  return CardWidget(
                                    tanggal: AllMaterial.setiapNamaHurufPertama(
                                        ajuanList[index].siswa?.nama ?? ""),
                                    icon: CircleAvatar(
                                      backgroundColor: const Color(0xffF8F8F8),
                                      child: SvgPicture.asset(
                                        "assets/icons/tanda-seru.svg",
                                      ),
                                    ),
                                    keterangan: ajuanList[index]
                                            .siswa
                                            ?.kelas
                                            ?.nama
                                            .toString() ??
                                        "",
                                    onTap: () => Get.to(
                                      () =>
                                          const MenungguVerifikasiPklSiswaDudiView(),
                                      arguments: {"id": ajuanList[index].id},
                                    ),
                                  );
                                }),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),

                    // Expanded 2
                    (dibatalkanList.isEmpty)
                        ? const SizedBox.shrink()
                        : Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    controller.stringTitle[1],
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorBlue,
                                    ),
                                  ),
                                ),
                                ...List.generate(dibatalkanList.length,
                                    (dibatalkanIndex) {
                                  return CardWidget(
                                    tanggal: AllMaterial.setiapNamaHurufPertama(
                                        dibatalkanList[dibatalkanIndex]
                                                .siswa
                                                ?.nama ??
                                            ""),
                                    icon: CircleAvatar(
                                      backgroundColor: const Color(0xffF8F8F8),
                                      child: SvgPicture.asset(
                                        "assets/icons/tanda-silang.svg",
                                      ),
                                    ),
                                    keterangan: dibatalkanList[dibatalkanIndex]
                                            .siswa
                                            ?.kelas
                                            ?.nama
                                            .toString() ??
                                        "",
                                    onTap: () => Get.to(
                                      () =>
                                          const VerifikasiDibatalkanSiswaDudiView(),
                                      arguments: {
                                        "id":
                                            dibatalkanList[dibatalkanIndex].id,
                                      },
                                    ),
                                  );
                                }),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),

                    // Expanded 3
                    (diterimaList.isEmpty)
                        ? const SizedBox.shrink()
                        : Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    controller.stringTitle[2],
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontMedium,
                                      color: AllMaterial.colorBlue,
                                    ),
                                  ),
                                ),
                                ...List.generate(diterimaList.length,
                                    (diterimaIndex) {
                                  return CardWidget(
                                    tanggal: AllMaterial.setiapNamaHurufPertama(
                                        diterimaList[diterimaIndex]
                                                .siswa
                                                ?.nama ??
                                            ""),
                                    icon: CircleAvatar(
                                      backgroundColor: const Color(0xffF8F8F8),
                                      child: SvgPicture.asset(
                                        "assets/icons/checklist.svg",
                                      ),
                                    ),
                                    keterangan: diterimaList[diterimaIndex]
                                            .siswa
                                            ?.kelas
                                            ?.nama
                                            .toString() ??
                                        "",
                                    onTap: () => Get.to(
                                        () =>
                                            const VerifikasiSelesaiPklSiswaDudiView(),
                                        arguments: {
                                          "id": diterimaList[diterimaIndex].id
                                        }),
                                  );
                                }),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
