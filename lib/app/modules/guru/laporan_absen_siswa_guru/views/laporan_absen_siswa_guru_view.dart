import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/histori_absen_siswa_guru/views/histori_absen_siswa_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/laporan_absen_siswa_guru_controller.dart';

class LaporanAbsenSiswaGuruView
    extends GetView<LaporanAbsenSiswaGuruController> {
  const LaporanAbsenSiswaGuruView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanAbsenSiswaGuruController());
    controller.fetchHistoriAbsen();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Absen Siswa',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              Obx(() {
                if (controller.historiAllAbsenSiswaGuru.value == null ||
                    controller.historiAllAbsenSiswaGuru.value!.data!.isEmpty) {
                  return Expanded(
                    child: Column(
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
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller
                          .historiAllAbsenSiswaGuru.value!.data!.length,
                      itemBuilder: (context, dayIndex) {
                        var tanggal = controller
                            .historiAllAbsenSiswaGuru.value!.data!.keys
                            .toList()[dayIndex];
                        var absen = controller.historiAllAbsenSiswaGuru.value!
                                .data![tanggal] ??
                            [];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                AllMaterial.setiapHurufPertama(tanggal),
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlue,
                                ),
                              ),
                            ),
                            ListView.builder(
                              itemCount: absen.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, cardIndex) {
                                return CardWidget(
                                  tanggal: AllMaterial.setiapHurufPertama(
                                      absen[cardIndex].siswa?.nama ?? ""),
                                  icon: CircleAvatar(
                                    backgroundColor: const Color(0xffF8F8F8),
                                    backgroundImage: (absen[cardIndex]
                                                .siswa
                                                ?.fotoProfile !=
                                            null)
                                        ? NetworkImage(absen[cardIndex]
                                            .siswa!
                                            .fotoProfile!
                                            .replaceAll(
                                                "localhost", "10.0.2.2"))
                                        : const AssetImage(
                                                "assets/images/foto-profile.png")
                                            as ImageProvider,
                                    child:
                                        (absen[cardIndex].siswa?.fotoProfile ==
                                                null)
                                            ? SvgPicture.asset(
                                                "assets/icons/person.svg")
                                            : null,
                                  ),
                                  keterangan:
                                      absen[cardIndex].siswa?.kelas?.nama ?? "",
                                  onTap: () => Get.to(
                                      () => const HistoriAbsenSiswaGuruView(),
                                      arguments: {
                                        "nama":
                                            absen[cardIndex].siswa?.nama ?? "",
                                        "id": absen[cardIndex].siswa?.id,
                                      }),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
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
  final LaporanAbsenSiswaGuruController controller;

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
