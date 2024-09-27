import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';

import '../controllers/verifikasi_selesai_pkl_siswa_dudi_controller.dart';

class VerifikasiSelesaiPklSiswaDudiView
    extends GetView<VerifikasiSelesaiPklSiswaDudiController> {
  const VerifikasiSelesaiPklSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
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
                    SvgPicture.asset("assets/icons/ajuan-diterima.svg"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Ajuan Diterima",
                          style: AllMaterial.montSerrat(
                            color: AllMaterial.colorWhite,
                            fontSize: 20,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Untuk : Habil Arlian Asrori",
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
                              "Status Info:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "Verifikasi Selesai",
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
                              "Tanggal Verifikasi:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "20 Februari 2024",
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
                              "Instansi Dipilih:",
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
                              "No. Telepon Instansi:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "+62 987654321",
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
                              "Alamat Instansi:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "Jl. Lorem ipsum, Dolor sit 4",
                              style: AllMaterial.montSerrat(
                                fontSize: 16,
                                fontWeight: AllMaterial.fontBold,
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
