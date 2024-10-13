import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/buat_laporan_siswa/views/buat_laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/laporan_kendala_siswa_controller.dart';

class LaporanKendalaSiswaView extends GetView<LaporanKendalaSiswaController> {
  const LaporanKendalaSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Kendala Saya',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              // Expanded(
              //   child: Obx(() {
              //     if (controller.historiAbsenM.isEmpty) {
              //       return const Center(child: Text("Tidak ada historiAbsen di bulan ini"));
              //     }
              //     return ListView.builder(
              //       itemCount: controller.historiAbsenM.length,
              //       itemBuilder: (context, index) {
              //         final item = controller.historiAbsenM[index];
              //         return CardWidget(
              //           tanggal: item.tanggal,
              //           icon: Icon(
              //             item.icon,
              //             color: item.color,
              //           ),
              //           keterangan: item.status,
              //         );
              //       },
              //     );
              //   }),
              // ),

              //tanpa api
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return CardWidget(
                        onTap: () =>
                            Get.to(() => const DetilLaporanSiswaView()),
                        tanggal: "Sabtu, 24 Agustus 2024",
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: "Belajar Instalasi PHP",
                      );
                    }),
              ),
              const SizedBox(height: 60),
              // SizedBox(
              //   height: 65,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: controller.dudi.value?.countPage ?? 1,
              //       itemBuilder: (context, index) => Obx(
              //         () => GestureDetector(
              //           onTap: () {
              //             if (controller.dudi.value!.countPage > 1) {
              //               controller.changePage(index);
              //             }
              //           },
              //           child: Container(
              //             width: 50,
              //             alignment: Alignment.center,
              //             padding: const EdgeInsets.symmetric(horizontal: 20),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               color: (controller.intPage.value == index)
              //                   ? AllMaterial.colorBlue
              //                   : AllMaterial.colorWhite,
              //             ),
              //             margin: const EdgeInsets.symmetric(horizontal: 5),
              //             child: Text(
              //               "${index + 1}",
              //               style: AllMaterial.montSerrat(
              //                 fontSize: 16,
              //                 fontWeight: AllMaterial.fontSemiBold,
              //                 color: (controller.intPage.value == index)
              //                     ? AllMaterial.colorWhite
              //                     : AllMaterial.colorBlue,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        tooltip: "Buat Laporan Kendala",
        backgroundColor: AllMaterial.colorBlue,
        child: const Icon(
          Icons.add,
          color: AllMaterial.colorWhite,
        ),
        onPressed: () {
          Get.to(() => const BuatLaporanSiswaView());
        },
      ),
    );
  }
}
