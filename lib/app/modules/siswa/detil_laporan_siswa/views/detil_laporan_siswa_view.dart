import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_siswa/controllers/laporan_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';

import '../controllers/detil_laporan_siswa_controller.dart';

class DetilLaporanSiswaView extends GetView<DetilLaporanSiswaControllr> {
  const DetilLaporanSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilLaporanSiswaControllr());
    final profController = Get.put(ProfileSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                height: 300,
                width: Get.width,
                color: AllMaterial.colorBlue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/laporan.svg"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: Get.width,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Laporan Harian",
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorWhite,
                              fontSize: 20,
                              fontWeight: AllMaterial.fontSemiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Oleh : ${AllMaterial.setiapHurufPertama(profController.profil.value?.nama ?? 'Tidak diketahui')}",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontSize: 15,
                        fontWeight: AllMaterial.fontRegular,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 250),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AllMaterial.colorWhite,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(34, 63, 63, 63),
                            offset: Offset(5, 5),
                            blurRadius: 25,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            title: (LaporanSiswaController.isKendala.isTrue)
                                ? Text(
                                    "Kendala Terkait:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  )
                                : Text(
                                    "Topik Pekerjaan:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                            subtitle: (LaporanSiswaController.isKendala.isTrue)
                                ? Text(
                                    AllMaterial.hurufPertama(
                                      controller.kendala.value?.kendala ??
                                          "Tidak ada data",
                                    ),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  )
                                : Text(
                                    AllMaterial.hurufPertama(
                                      controller
                                              .laporan.value?.topikPekerjaan ??
                                          "Tidak ada data",
                                    ),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            title: (LaporanSiswaController.isKendala.isTrue)
                                ? Text(
                                    "Deskripsi Kendala:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  )
                                : Text(
                                    "Rujukan Kompetensi Dasar:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                            subtitle: (LaporanSiswaController.isKendala.isTrue)
                                ? Text(
                                    AllMaterial.hurufPertama(
                                      controller.kendala.value?.deskripsi ??
                                          "Tidak ada data",
                                    ),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  )
                                : Text(
                                    AllMaterial.hurufPertama(
                                      controller.laporan.value
                                              ?.rujukanKompetensiDasar ??
                                          "Tidak ada data",
                                    ),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            title: Text(
                              "Instansi terkait:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              profController.profil.value?.dudi
                                      ?.namaInstansiPerusahaan
                                      ?.toUpperCase() ??
                                  "Tidak diketahui",
                              style: AllMaterial.montSerrat(
                                fontSize: 16,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                          ),
                          (LaporanSiswaController.isKendala.isTrue)
                              ? (controller.kendala.value!.fileLaporan == null)
                                  ? const SizedBox.shrink()
                                  : ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 15,
                                      ),
                                      title: Text(
                                        "Bukti Dokumentasi:",
                                        style: AllMaterial.montSerrat(
                                          fontSize: 13,
                                        ),
                                      ),
                                      subtitle: GestureDetector(
                                        onTap: () {
                                          // print(
                                          //     "di ontap: ${controller.buktiDokumen.value}");
                                          // final File? file = controller.buktiDokumen.value;
                                          // final String fileUrl = controller.buktiDokumenUrl.value;
                                          // if (file != null && fileUrl.isNotEmpty) {
                                          //   controller.openFile(fileUrl, file);
                                          // } else {
                                          //   AllMaterial.cusBottomSheet(
                                          //     text: "Kesalahan!",
                                          //     subtitle: "Dokumen tidak ditemukan",
                                          //   );
                                          // }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.black87
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.description,
                                                color: Colors.black87
                                                    .withOpacity(0.7),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  controller.laporan.value!
                                                              .dokumentasi ==
                                                          null
                                                      ? ""
                                                      : controller.laporan
                                                          .value!.dokumentasi!
                                                          .split('/')
                                                          .last
                                                          .toString()
                                                          .split(' ')
                                                          .join('-'),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AllMaterial.montSerrat(
                                                    color: Colors.black87
                                                        .withOpacity(0.7),
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                              : (controller.laporan.value!.dokumentasi == null)
                                  ? const SizedBox.shrink()
                                  : ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 15,
                                      ),
                                      title: Text(
                                        "Bukti Dokumentasi:",
                                        style: AllMaterial.montSerrat(
                                          fontSize: 13,
                                        ),
                                      ),
                                      subtitle: GestureDetector(
                                        onTap: () {
                                          // print(
                                          //     "di ontap: ${controller.buktiDokumen.value}");
                                          // final File? file = controller.buktiDokumen.value;
                                          // final String fileUrl = controller.buktiDokumenUrl.value;
                                          // if (file != null && fileUrl.isNotEmpty) {
                                          //   controller.openFile(fileUrl, file);
                                          // } else {
                                          //   AllMaterial.cusBottomSheet(
                                          //     text: "Kesalahan!",
                                          //     subtitle: "Dokumen tidak ditemukan",
                                          //   );
                                          // }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.black87
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.description,
                                                color: Colors.black87
                                                    .withOpacity(0.7),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: Text(
                                                  controller.laporan.value!
                                                              .dokumentasi ==
                                                          null
                                                      ? ""
                                                      : controller.laporan
                                                          .value!.dokumentasi!
                                                          .split('/')
                                                          .last
                                                          .toString()
                                                          .split(' ')
                                                          .join('-'),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AllMaterial.montSerrat(
                                                    color: Colors.black87
                                                        .withOpacity(0.7),
                                                    fontWeight:
                                                        AllMaterial.fontMedium,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AllMaterial.colorBlue,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Kembali Ke Beranda',
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontSemiBold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
