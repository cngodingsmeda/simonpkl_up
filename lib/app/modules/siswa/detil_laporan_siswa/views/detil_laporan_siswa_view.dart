import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';

import '../controllers/detil_laporan_siswa_controller.dart';

class DetilLaporanSiswaView extends GetView<DetilLaporanSiswaControllr> {
  const DetilLaporanSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var role = Get.arguments;
    bool isKendala = AllMaterial.box.read("isKendala");
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
                      role == "Instansi"
                          ? "Oleh : CV. GLOBAL VINTAGE NUMERATION"
                          : "Oleh : Habil Arlian Asrori",
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
                              isKendala
                                  ? "Kendala Terkait:"
                                  : "Topik Pekerjaan:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "Belajar Instalasi PHP",
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
                              isKendala
                                  ? "Deskripsi Kendala:"
                                  : "Rujukan Kompetensi Dasar:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "Pemrograman Web",
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
                              role == "Instansi"
                                  ? "Siswa Terkait:"
                                  : "Instansi terkait:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              role == "Instansi"
                                  ? "Gheral Deva Bagus Archana"
                                  : "CV GLOBAL VINTAGE NUMERATION",
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
                              "Bukti Dokumen (Opsional):",
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
                                        "file.docx",
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  AllMaterial.messageScaffold(
                    title: "Fitur Sedang Digarap, Coming Soon",
                    context: context,
                  );
                },
                icon: Icon(MdiIcons.whatsapp, color: AllMaterial.colorWhite),
                label: Text(
                  'Hubungi $role Ini',
                  style: AllMaterial.montSerrat(
                    fontWeight: AllMaterial.fontSemiBold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AllMaterial.colorBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: OutlinedButton.icon(
                onPressed: () {
                  Get.back();
                },
                label: Text(
                  'Kembali Ke Beranda',
                  style: AllMaterial.montSerrat(
                    fontWeight: AllMaterial.fontSemiBold,
                    color: AllMaterial.colorBlue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AllMaterial.colorBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: AllMaterial.colorBlue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
