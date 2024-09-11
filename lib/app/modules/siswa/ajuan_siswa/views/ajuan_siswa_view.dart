import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';

import '../controllers/ajuan_siswa_controller.dart';

class AjuanSiswaView extends GetView<AjuanSiswaController> {
  const AjuanSiswaView({super.key});
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
                    Icon(
                      MdiIcons.clockCheckOutline,
                      color: AllMaterial.colorWhite,
                      size: 80,
                    ),
                    Text(
                      "Ajuan Diproses",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontSize: 25,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    Text(
                      "Harap verifikasi data Anda!",
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
              margin: const EdgeInsets.only(top: 240),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "Status Info :",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "Menunggu Verifikasi",
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
                              "Instansi Dipilih :",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              // "${dataDudiIndex["nama_instansi_perusahaan"]}"
                              //     .capitalizeEach(),
                              "CV. Global Vintage Numeration",
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
                              "Batas Verifikasi :",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              // "Sampai ${controller.formattedDate}",
                              "Sampai 25 Agustus 2024",
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
                              "No. Telpon Instansi :",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              // "${dataDudiIndex["no_telepon"]}",
                              "081257421421",
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
                              "Alamat Instansi :",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              // "${dataDudiIndex["detail_tempat"]}, ${dataDudiIndex["desa"]}, ${dataDudiIndex["kecamatan"]}, ${dataDudiIndex["kabupaten"]}, ${dataDudiIndex["provinsi"]}"
                              //     .capitalizeEach(),
                              "Jl. Gomong Sakura, Nusa Tenggara Barat",
                              style: AllMaterial.montSerrat(
                                fontSize: 16,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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
          var status = Get.put(HomepageSiswaController());
          if (status.statusPKL() == "belum pkl") {
            Get.off(() => HomeSiswaView());
            status.status.value = "menunggu pkl";
          } else {
            Get.back();
          }
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
