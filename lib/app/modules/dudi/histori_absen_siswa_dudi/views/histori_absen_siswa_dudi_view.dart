import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/views/detil_histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/views/histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/histori_absen_siswa_dudi_controller.dart';

class HistoriAbsenSiswaDudiView
    extends GetView<HistoriAbsenSiswaDudiController> {
  const HistoriAbsenSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HistoriAbsenSiswaDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Absen Aditya',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            children: [
              // Chip untuk memilih bulan
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Juli',
                      month: 7,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Agustus',
                      month: 8,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'September',
                      month: 9,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Oktober',
                      month: 10,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'November',
                      month: 11,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Desember',
                      month: 12,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

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
                child: Obx(
                  () => controller.historiAbsen.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.historiAbsen.length,
                          itemBuilder: (context, index) {
                            var item = controller.historiAbsen[index];
                            return CardWidget(
                              tanggal: item["tanggal"],
                              icon: Icon(
                                item["icon"],
                                color: item["color"],
                              ),
                              onTap: () => Get.to(
                                  () => const DetilHistoriAbsenSiswaView()),
                              keterangan: item["status"],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "Tidak ada histori absen untuk bulan ini",
                            style: AllMaterial.montSerrat(),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
