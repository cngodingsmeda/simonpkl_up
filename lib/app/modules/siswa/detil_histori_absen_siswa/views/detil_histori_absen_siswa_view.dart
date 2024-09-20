import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/absen_abnormal_siswa/controllers/absen_abnormal_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/controllers/detil_histori_absen_siswa_controller.dart';

class DetilHistoriAbsenSiswaView extends GetView<DetilHistoriAbsenSiswaControllr> {
  const DetilHistoriAbsenSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    final DetilHistoriAbsenSiswaControllr controller =
        Get.put(DetilHistoriAbsenSiswaControllr());
    final AbsenAbnormalSiswaController absen =
        Get.put(AbsenAbnormalSiswaController());
    controller.buktiDokumen = absen.selectedFile;

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: Obx(() {
        return SingleChildScrollView(
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
                      SvgPicture.asset("assets/icons/absen.svg"),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Senin, 25 Agustus 2024",
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorWhite,
                              fontSize: 20,
                              fontWeight: AllMaterial.fontSemiBold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Jenis Absen : Absen Masuk",
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
                              title: Text(
                                "Status Absen:",
                                style: AllMaterial.montSerrat(
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: Text(
                                "Di dalam radius",
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
                                "Waktu Absen:",
                                style: AllMaterial.montSerrat(
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: Text(
                                "10:24",
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
                                "Keterangan Absen:",
                                style: AllMaterial.montSerrat(
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: Text(
                                "Saya berhalangan PKL hari ini",
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
                                "Keterangan Waktu:",
                                style: AllMaterial.montSerrat(
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: Text(
                                "Tepat Waktu",
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
                                "CV GLOBAL VINTAGE NUMERATION",
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
                                "Jam Ditentukan:",
                                style: AllMaterial.montSerrat(
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: Text(
                                "10:00 - 18:25",
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
                                "Bukti Dokumen:",
                                style: AllMaterial.montSerrat(
                                  fontSize: 13,
                                ),
                              ),
                              subtitle: GestureDetector(
                                onTap: () {
                                  print(
                                      "di ontap: ${controller.buktiDokumen.value}");
                                  final File? file =
                                      controller.buktiDokumen.value;
                                  final String fileUrl =
                                      controller.buktiDokumenUrl.value;
                                  if (file != null && fileUrl.isNotEmpty) {
                                    controller.openFile(fileUrl, file);
                                  } else {
                                    AllMaterial.cusBottomSheet(
                                      text: "Kesalahan!",
                                      subtitle: "Dokumen tidak ditemukan",
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black87.withOpacity(0.7),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.description,
                                        color: Colors.black87.withOpacity(0.7),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          controller.buktiDokumen.value != null
                                              ? controller
                                                  .buktiDokumen.value!.path
                                                  .split('/')
                                                  .last
                                              : "file.docx",
                                          overflow: TextOverflow.ellipsis,
                                          style: AllMaterial.montSerrat(
                                            color:
                                                Colors.black87.withOpacity(0.7),
                                            fontWeight: AllMaterial.fontMedium,
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
        );
      }),
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
