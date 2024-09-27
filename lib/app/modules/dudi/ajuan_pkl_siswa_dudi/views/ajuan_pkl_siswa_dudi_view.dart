// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/views/menunggu_verifikasi_pkl_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/verifikasi_selesai_pkl_siswa_dudi/views/verifikasi_selesai_pkl_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/ajuan_pkl_siswa_dudi_controller.dart';

class AjuanPklSiswaDudiView extends GetView<AjuanPklSiswaDudiController> {
  const AjuanPklSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AjuanPklSiswaDudiController());
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // Expanded 1
              Container(
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
                    ...List.generate(3, (cardIndex) {
                      return CardWidget(
                        tanggal: "Habil Arlian Asrori",
                        icon: CircleAvatar(
                          backgroundColor: const Color(0xffF8F8F8),
                          child: SvgPicture.asset(
                            "assets/icons/tanda-seru.svg",
                          ),
                        ),
                        keterangan: "XI RPL 5",
                        onTap: () => Get.to(
                          () => const MenungguVerifikasiPklSiswaDudiView(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Expanded 2
              Container(
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
                    ...List.generate(3, (cardIndex) {
                      return CardWidget(
                        tanggal: "Habil Arlian Asrori",
                        icon: CircleAvatar(
                          backgroundColor: const Color(0xffF8F8F8),
                          child: SvgPicture.asset(
                            "assets/icons/tanda-silang.svg",
                          ),
                        ),
                        keterangan: "XI RPL 5",
                        onTap: () => Get.to(
                          () => const VerifikasiSelesaiPklSiswaDudiView(),
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Expanded 3
              Container(
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
                    ...List.generate(3, (cardIndex) {
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
                          () => const VerifikasiSelesaiPklSiswaDudiView(),
                        ),
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
