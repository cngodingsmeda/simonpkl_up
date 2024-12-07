import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/detil_absen_siswa_guru/controllers/detil_absen_siswa_guru_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/histori_absen_siswa_guru_controller.dart';

class HistoriAbsenSiswaGuruView
    extends GetView<HistoriAbsenSiswaGuruController> {
  const HistoriAbsenSiswaGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HistoriAbsenSiswaGuruController());
    var arg = Get.arguments;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Absen ${AllMaterial.setiapHurufPertama((arg["nama"].toString().split(' ').length) > 1 ? (arg["nama"].toString().split(' ')[0].length) <= 2 ? arg["nama"].toString().split(' ')[1] : arg["nama"].toString().split(' ')[0] : arg["nama"].toString())}',
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
                  () => (controller.historiAbsenSiswaGuru.value == null ||
                          controller
                              .historiAbsenSiswaGuru.value!.data!.isNotEmpty)
                      ? ListView.builder(
                          itemCount: controller
                                  .historiAbsenSiswaGuru.value?.data?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var item = controller
                                .historiAbsenSiswaGuru.value?.data?[index];
                            var status = item!.status.toString().contains("_")
                                ? item.status.toString().split("_").join(" ")
                                : item.status;
                            return CardWidget(
                              tanggal:
                                  AllMaterial.setiapHurufPertama(item.tanggal),
                              icon: Icon(
                                controller.iconCard(status!.toLowerCase()),
                                color:
                                    controller.iconColor(status.toLowerCase()),
                              ),
                              onTap: () {
                                if (item.status!.contains("tidak")) {
                                  AllMaterial.messageScaffold(
                                    title: "Siswa melewatkan Absen Harian!",
                                  );
                                } else {
                                  showDialog(context: context,
                                    builder: (context) {
                                      return AllMaterial.cusDialog(
                                        topTitle: "Absen Harian",
                                        path: "assets/icons/laporan.svg",
                                        dateTime:
                                            AllMaterial.setiapHurufPertama(
                                                item.tanggal),
                                        onTap1: () {
                                          var absensi = Get.put(
                                              DetilAbsenSiswaGuruController());
                                          absensi.getDetilAbsenById(
                                            item.id!.toInt(),
                                            "masuk",
                                            item.status!,
                                            item.siswa!.nama!,
                                          );
                                        },
                                        onTap2: () {
                                          var absensi = Get.put(
                                              DetilAbsenSiswaGuruController());
                                          if (item.statusAbsenPulang == null) {
                                            Get.back();
                                            AllMaterial.messageScaffold(
                                              title:
                                                  "Absen Pulang tidak ditemukan!",
                                            );
                                          } else {
                                            absensi.getDetilAbsenById(
                                              item.id!.toInt(),
                                              "pulang",
                                              item.status!,
                                              item.siswa!.nama!,
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
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Tidak ada histori absen untuk bulan ini",
                                style: AllMaterial.montSerrat(),
                              ),
                            ),
                          ],
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
  // ignore: prefer_typing_uninitialized_variables
  final HistoriAbsenSiswaGuruController controller;

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
            controller.fetchHistoriAbsen();
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
