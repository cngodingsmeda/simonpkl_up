import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/laporan_siswa_guru_controller.dart';

class LaporanSiswaGuruView extends GetView<LaporanSiswaGuruController> {
  const LaporanSiswaGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isKendala = AllMaterial.box.read("isKendala") ?? false;
    var role = Get.arguments;

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          isKendala ? "Kendala $role" : 'Laporan $role',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, dayIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Selasa, 25 Agustus 2024",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorBlue,
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, cardIndex) {
                          return CardWidget(
                            tanggal: "Habil Arlian Asrori",
                            icon: CircleAvatar(
                              backgroundColor: const Color(0xffF8F8F8),
                              child: SvgPicture.asset(
                                "assets/icons/checklist.svg",
                              ),
                            ),
                            keterangan: "XI RPL 5",
                            onTap: () => Get.to(
                              () => const DetilLaporanSiswaView(),
                              arguments: role.toString() == "Dudi"
                                  ? "Instansi"
                                  : "Siswa",
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
       GestureDetector(
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
