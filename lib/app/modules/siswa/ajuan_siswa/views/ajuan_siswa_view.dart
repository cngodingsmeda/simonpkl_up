import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';

import '../controllers/ajuan_siswa_controller.dart';

class AjuanSiswaView extends GetView<AjuanSiswaController> {
  const AjuanSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.arguments;
    var controller = Get.put(AjuanSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: FutureBuilder(
        future: controller.getAjuanPklById(id),
        builder: (context, snapshot) {
          var dataAjuan = controller.ajuanPklById.value;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(vertical: 0),
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
                          TextInfoAjuan(
                            controller: controller,
                            title: "Status Info :",
                            subtitle: "Verifikasi Selesai",
                          ),
                          TextInfoAjuan(
                            controller: controller,
                            title: "Instansi Dipilih :",
                            subtitle: dataAjuan!.dudi.namaInstansiPerusahaan,
                          ),
                          TextInfoAjuan(
                            controller: controller,
                            title: "Tanggal Ajuan Verifikasi :",
                            subtitle: AllMaterial.ubahTanggal(
                              dataAjuan.waktuPengajuan.toIso8601String(),
                            ),
                          ),
                          TextInfoAjuan(
                            controller: controller,
                            title: "No. Telpon Instansi :",
                            subtitle: dataAjuan.dudi.noTelepon,
                          ),
                          TextInfoAjuan(
                            controller: controller,
                            title: "Alamat Instansi :",
                            subtitle: AllMaterial.setiapHurufPertama(
                                "${dataAjuan.dudi.alamat.detailTempat}, ${dataAjuan.dudi.alamat.desa}, ${dataAjuan.dudi.alamat.kecamatan}, ${dataAjuan.dudi.alamat.kabupaten}, ${dataAjuan.dudi.alamat.kabupaten}, ${dataAjuan.dudi.alamat.provinsi}"),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          var status = AllMaterial.box.read("statusSiswa");
          if (status == null || status == "") {
            Get.off(() => HomeSiswaView());
            AllMaterial.box.write("statusSiswa", "proses");
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

class TextInfoAjuan extends StatelessWidget {
  TextInfoAjuan({
    super.key,
    required this.controller,
    required this.title,
    required this.subtitle,
  });

  final AjuanSiswaController controller;
  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 15,
      ),
      title: Text(
        title,
        style: AllMaterial.montSerrat(fontSize: 13),
      ),
      subtitle: Text(
        subtitle,
        style: AllMaterial.montSerrat(
          fontSize: 16,
          fontWeight: AllMaterial.fontBold,
        ),
      ),
    );
  }
}
