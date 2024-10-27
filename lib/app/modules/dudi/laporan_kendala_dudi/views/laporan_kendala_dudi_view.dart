import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/buat_laporan_pkl_dudi/views/buat_laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/laporan_kendala_dudi_controller.dart';

class LaporanKendalaDudiView extends GetView<LaporanKendalaDudiController> {
  const LaporanKendalaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    final laporanSiswaC = Get.put(LaporanPklDudiController());
    final controller = Get.put(LaporanKendalaDudiController());
    controller.getAllLaporanKendalaDudi();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
            LaporanPklDudiController.isKendala.value = false;
            laporanSiswaC.getAllLaporanHarianDudi();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
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
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  final laporanHarian = controller.laporanKendala.value;
                  if (laporanHarian == null ||
                      laporanHarian.data == null ||
                      laporanHarian.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada laporan kendala",
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
                            controller.deleteLaporanDudi(item.id!, context);
                            reversedData.removeAt(index);
                            controller.laporanKendala.refresh();
                          },
                        ),
                        onTap: () {
                          controller.getLaporanKendalaByIdDudi(
                            item.id != null ? item.id!.toInt() : 0,
                          );
                        },
                        tanggal: AllMaterial.ubahHari(
                          item.tanggal!.toIso8601String(),
                        ),
                        icon: const Icon(
                          Icons.info_sharp,
                          color: Colors.yellow,
                        ),
                        keterangan: AllMaterial.setiapHurufPertama(
                          item.kendala.toString(),
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
        tooltip: "Buat Laporan Kendala",
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
