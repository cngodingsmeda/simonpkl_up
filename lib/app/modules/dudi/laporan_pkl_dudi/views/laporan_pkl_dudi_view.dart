// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/buat_laporan_pkl_dudi/views/buat_laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/detil_laporan_pkl_dudi/views/detil_laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/laporan_pkl_dudi_controller.dart';

class LaporanPklDudiView extends GetView<LaporanPklDudiController> {
  const LaporanPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isKendala = AllMaterial.box.read("isKendala") ?? false;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          isKendala ? "Kendala Saya" : 'Laporan Saya',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            AllMaterial.box.remove("isKendala");
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return CardWidget(
                        onTap: () =>
                            Get.to(() => const DetilLaporanPklDudiView()),
                        tanggal: "Sabtu, 24 Agustus 2024",
                        icon: isKendala
                            ? CircleAvatar(
                                backgroundColor: const Color(0xffF8F8F8),
                                child: SvgPicture.asset(
                                  "assets/icons/tanda-seru.svg",
                                  color: Colors.yellow,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: const Color(0xffF8F8F8),
                                child: SvgPicture.asset(
                                  "assets/icons/checklist.svg",
                                ),
                              ),
                        keterangan: "Belajar Instalasi PHP",
                      );
                    }),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        tooltip: isKendala ? "Buat Kendala" : "Buat Laporan",
        backgroundColor: AllMaterial.colorBlue,
        child: const Icon(
          Icons.add,
          color: AllMaterial.colorWhite,
        ),
        onPressed: () {
          Get.to(() => const BuatLaporanPklDudiView());
        },
      ),
    );
  }
}
