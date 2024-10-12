// historiAbsen_siswa_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/controllers/detil_histori_absen_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/controllers/histori_absen_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

class HistoriAbsenSiswaView extends GetView<HistoriAbsenSiswaControllr> {
  const HistoriAbsenSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoriAbsenSiswaControllr controller =
        Get.put(HistoriAbsenSiswaControllr());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Histori Absen',
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
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Januari',
                      month: 1,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Februari',
                      month: 2,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Maret',
                      month: 3,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'April',
                      month: 4,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Mei',
                      month: 5,
                    ),
                    const SizedBox(width: 8),
                    ChoiceChipWidget(
                      controller: controller,
                      label: 'Juni',
                      month: 6,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => controller.absen.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.absen.length,
                          itemBuilder: (context, index) {
                            var item = controller.absen[index];
                            var status = item.status.toString().contains("_")
                                ? item.status.toString().split("_").join(" ")
                                : item.status;
                            return CardWidget(
                              tanggal: AllMaterial.ubahHari(
                                  item.tanggal!.toIso8601String()),
                              icon: Icon(
                                controller.iconCard(status!.toLowerCase()),
                                color:
                                    controller.iconColor(status.toLowerCase()),
                              ),
                              onTap: () {
                                if (item.status!.contains("tidak")) {
                                  AllMaterial.messageScaffold(
                                      title: "Anda melewatkan Absen Harian!",
                                      context: context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AllMaterial.cusDialog(
                                        topTitle: "Absen Harian",
                                        path: "assets/icons/laporan.svg",
                                        dateTime: AllMaterial.ubahHari(
                                          item.tanggal!.toIso8601String(),
                                        ),
                                        onTap1: () {
                                          var absensi = Get.put(
                                              DetilHistoriAbsenSiswaControllr());
                                          absensi.getDetilAbsenById(
                                            item.id!.toInt(),
                                            "masuk",
                                            item.status!,
                                          );
                                        },
                                        onTap2: () {
                                          var absensi = Get.put(
                                              DetilHistoriAbsenSiswaControllr());
                                          if (item.statusAbsenPulang == null) {
                                            Get.back();
                                            AllMaterial.messageScaffold(
                                                title:
                                                    "Absen Pulang tidak ditemukan!",
                                                context: context);
                                          } else {
                                            absensi.getDetilAbsenById(
                                              item.id!.toInt(),
                                              "pulang",
                                              item.status!,
                                            );
                                          }
                                        },
                                      );
                                    },
                                  );
                                }
                              },
                              keterangan:
                                  AllMaterial.setiapHurufPertama(status),
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

class ChoiceChipWidget extends StatelessWidget {
  final String label;
  final int month;
  final HistoriAbsenSiswaControllr controller;

  const ChoiceChipWidget({
    super.key,
    required this.label,
    required this.month,
    required this.controller,
  });

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
            controller.updateHistoriAbsen(month);
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
