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
              LaporanSiswaController.isKendala.value = true;
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
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  final laporanHarian = controller.laporanHarian.value;
                  if (laporanHarian == null ||
                      laporanHarian.data == null ||
                      laporanHarian.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada laporan harian",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  final reversedData = laporanHarian.data!.reversed.toList();

                  return ListView.builder(
                    itemCount: reversedData.length,
                    itemBuilder: (context, index) {
                      final item = reversedData[index];
                      return CardWidget(
                        onPress: () => AllMaterial.cusDialogValidasi(
                          title: "Menghapus Laporan",
                          subtitle: "Apakah anda yakin?",
                          onCancel: () => Get.back(),
                          onConfirm: () {
                            controller.deleteLaporanSiswa(item.id!, context);
                            reversedData.removeAt(index);
                            controller.laporanHarian.refresh();
                          },
                        ),
                        onTap: () {
                          controller.getLaporanHarianByIdSiswa(
                            item.id != null ? item.id!.toInt() : 0,
                          );
                        },
                        tanggal: AllMaterial.ubahHari(
                          item.tanggal!.toIso8601String(),
                        ),
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: AllMaterial.setiapHurufPertama(
                          item.topikPekerjaan.toString(),
                        ),
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
