import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/buat_laporan_siswa/views/buat_laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_kendala_siswa/views/laporan_kendala_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_siswa/controllers/laporan_siswa_controller.dart';

class LaporanSiswaView extends GetView<LaporanSiswaController> {
  const LaporanSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LaporanSiswaController());
    controller.getAllLaporanHarianSiswa();

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
        actions: [
          IconButton(
            padding: const EdgeInsets.all(16),
            tooltip: "Kendala Saya",
            onPressed: () {
              AllMaterial.box.write("isKendala", true);
              Get.to(() => const LaporanKendalaSiswaView());
            },
            icon: const Icon(
              Icons.report_problem,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  // Check if laporanHarian is null or data is null
                  if (controller.laporanHarian.value == null ||
                      controller.laporanHarian.value!.data == null ||
                      controller.laporanHarian.value!.data!.isEmpty) {
                    return const Center(
                        child: Text("Tidak ada laporan harian"));
                  }
                  return ListView.builder(
                    itemCount: controller.laporanHarian.value!.data!.length,
                    itemBuilder: (context, index) {
                      final item = controller.laporanHarian.value!.data![index];
                      return CardWidget(
                        onTap: () {
                          controller.getLaporanHarianByIdSiswa(
                              item.id != null ? item.id!.toInt() : 0);
                        },
                        tanggal: AllMaterial.ubahHari(
                            item.tanggal!.toIso8601String()),
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: AllMaterial.setiapHurufPertama(
                            item.topikPekerjaan.toString()),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 2,
        tooltip: "Buat Laporan Harian",
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
