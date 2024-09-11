import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/laporan_siswa_controller.dart';

class LaporanSiswaView extends GetView<LaporanSiswaController> {
  const LaporanSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LaporanSiswaController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Laporan Saya',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
            
              Expanded(
                child: Obx(
                  () => controller.laporan.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.laporan.length,
                          itemBuilder: (context, index) {
                            var item = controller.laporan[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Card(
                                surfaceTintColor: AllMaterial.colorWhite,
                                color: AllMaterial.colorWhite,
                                borderOnForeground: true,
                                shadowColor: AllMaterial.colorGreySec,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ListTile(
                                  onTap: () {},
                                  leading:
                                      Icon(item['icon'], color: item['color']),
                                  title: Text(
                                    item['tanggal'],
                                    style: AllMaterial.montSerrat(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    item['status'],
                                    style: AllMaterial.montSerrat(),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "Tidak ada laporan untuk bulan ini",
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

class ChoiceChipWidget extends StatelessWidget {
  final String label;
  final int month;
  final LaporanSiswaController controller;

  const ChoiceChipWidget(
      {super.key,
      required this.label,
      required this.month,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ChoiceChip(
        label: Text(label),
        checkmarkColor: AllMaterial.colorWhite,
        elevation: 0,
        disabledColor: AllMaterial.colorGreySec,
        shadowColor: Colors.transparent,
        side: const BorderSide(width: 0, color: Colors.transparent),
        selected: controller.selectedMonth.value == month,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          if (selected) {
            controller.updateLaporan(month);
          }
        },
        backgroundColor: Colors.grey[200],
        labelStyle: AllMaterial.montSerrat(
          color: controller.selectedMonth.value == month
              ? Colors.white
              : AllMaterial.colorGrey,
          fontWeight: controller.selectedMonth.value == month
              ? AllMaterial.fontMedium
              : AllMaterial.fontRegular,
        ),
      ),
    );
  }
}
