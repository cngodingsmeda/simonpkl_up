import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/buat_jadwal_absen_dudi/views/buat_jadwal_absen_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/jadwal_absen_siswa_dudi_controller.dart';

class JadwalAbsenSiswaDudiView extends GetView<JadwalAbsenSiswaDudiController> {
  const JadwalAbsenSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JadwalAbsenSiswaDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Jadwal Absen',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
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
                  final jadwal = controller.jadwalAbsen.value;

                  if (jadwal == null) {
                    return Center(
                      child: Text(
                        "Tidak ada jadwal absen",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  final jadwalAbsen = jadwal.data;
                  if (jadwalAbsen == null || jadwalAbsen.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada jadwal absen",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: jadwalAbsen.length,
                    itemBuilder: (context, index) {
                      final item = jadwalAbsen[index];
                      return CardWidget(
                        onTap: () {
                          Get.to(() => const BuatJadwalAbsenDudiView(),
                              arguments: {
                                "id": item.id ?? 0,
                                "data": item,
                              });
                          AllMaterial.box.write("isUpdate", true);
                          AllMaterial.box.write("isPost", false);
                        },
                        onPress: () {
                          AllMaterial.cusDialogValidasi(
                            title: "Menghapus Jadwal",
                            subtitle: "Apakah Anda yakin?",
                            onConfirm: () {
                              jadwalAbsen.removeAt(index);
                              controller.jadwalAbsen.refresh();
                              controller.deleteJadwalAbsen(
                                  item.id ?? 0, context);
                              Get.back();
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                        tanggal: (item.hari != null && item.hari!.isNotEmpty)
                            ? "Jadwal Absen Hari ${AllMaterial.hurufPertama(item.hari ?? "")}"
                            : "Jadwal Absen",
                        icon: item.enable ?? true
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.highlight_remove,
                                color: Colors.red,
                              ),
                        keterangan: item.enable ?? true
                            ? "Absen Aktif"
                            : "Absen Tidak Aktif",
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
        tooltip: "Buat Jadwal Absen",
        backgroundColor: AllMaterial.colorBlue,
        child: const Icon(
          Icons.add,
          color: AllMaterial.colorWhite,
        ),
        onPressed: () {
          Get.to(() => const BuatJadwalAbsenDudiView(), arguments: {"id": 0});
          AllMaterial.box.write("isUpdate", false);
          AllMaterial.box.write("isPost", true);
        },
      ),
    );
  }
}
