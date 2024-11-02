import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/lokasi_absen_dudi/views/lokasi_absen_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/daftar_lokasi_absen_dudi_controller.dart';

class DaftarLokasiAbsenDudiView
    extends GetView<DaftarLokasiAbsenDudiController> {
  const DaftarLokasiAbsenDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DaftarLokasiAbsenDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Lokasi Absen',
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
                  final lokasi = controller.lokasiAbsen.value;

                  if (lokasi == null) {
                    return Center(
                      child: Text(
                        "Tidak ada lokasi absen",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  final lokasiAbsen = lokasi.data;
                  if (lokasiAbsen == null || lokasiAbsen.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada lokasi absen",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: lokasiAbsen.length,
                    itemBuilder: (context, index) {
                      final item = lokasiAbsen[index];
                      print(item.namaTempat);
                      return CardWidget(
                        onTap: () {
                          Get.to(() => const LokasiAbsenDudiView(), arguments: {
                            "id": item.id ?? 0,
                            "data": item,
                          });
                          AllMaterial.box.write("isBuat", false);
                        },
                        onPress: () {
                          AllMaterial.cusDialogValidasi(
                            title: "Menghapus Lokasi",
                            subtitle: "Apakah Anda yakin?",
                            onConfirm: () {
                              lokasiAbsen.removeAt(index);
                              controller.lokasiAbsen.refresh();
                              controller.deleteKoordinatAbsen(
                                  item.id ?? 0, context);
                            },
                            onCancel: () => Get.back(),
                          );
                        },
                        tanggal: (item.namaTempat != null &&
                                item.namaTempat!.isNotEmpty)
                            ? item.namaTempat ?? ""
                            : "Nama tidak tersedia",
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan:
                            "Radius Absen: ${item.radiusAbsenMeter.toString()} meter",
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
        tooltip: "Buat Kuota Jurusan",
        backgroundColor: AllMaterial.colorBlue,
        child: const Icon(
          Icons.add,
          color: AllMaterial.colorWhite,
        ),
        onPressed: () {
          Get.to(() => const LokasiAbsenDudiView(), arguments: {"id": 0});
          AllMaterial.box.write("isBuat", true);
        },
      ),
    );
  }
}
