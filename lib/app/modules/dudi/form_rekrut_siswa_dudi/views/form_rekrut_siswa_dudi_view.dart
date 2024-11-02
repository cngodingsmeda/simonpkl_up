import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/buat_form_pkl_dudi/controllers/buat_form_pkl_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/buat_form_pkl_dudi/views/buat_form_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/form_rekrut_siswa_dudi_controller.dart';

class FormRekrutSiswaDudiView extends GetView<FormRekrutSiswaDudiController> {
  const FormRekrutSiswaDudiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormRekrutSiswaDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Kuota Jurusan',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
            AllMaterial.box.remove("isJadwal");
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
                  // Null safety handling untuk data kuota
                  final kuota = controller.kuotaDudi.value;
                  final jumlahKuotaSiswa = kuota?.data?.kuota;

                  if (jumlahKuotaSiswa == null) {
                    return Center(
                      child: Text(
                        "Tidak ada kuota jurusan",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  final kuotaJurusan = jumlahKuotaSiswa.kuotaJurusan;
                  if (kuotaJurusan == null || kuotaJurusan.isEmpty) {
                    return Center(
                      child: Text(
                        "Tidak ada kuota jurusan",
                        style: AllMaterial.montSerrat(),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: kuotaJurusan.length,
                    itemBuilder: (context, index) {
                      final item = kuotaJurusan[index];
                      final dudi = kuota!.data!;

                      return CardWidget(
                        onTap: () {
                          Get.to(() => const BuatFormPklDudiView(), arguments: {
                            "id": item.id ?? 0,
                            "data": item,
                          });
                          AllMaterial.box.write("isBuat", false);
                        },
                        tanggal:
                            "Form ${AllMaterial.setiapNamaHurufPertama(item.jurusan?.nama ?? "")}",
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: AllMaterial.setiapNamaHurufPertama(
                            dudi.namaInstansiPerusahaan ?? ""),
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

          // Dapatkan panjang kuota dan jurusan
          final kuotaJurusanLength =
              controller.kuotaDudi.value?.data?.kuota?.kuotaJurusan?.length ??
                  0;
          final jurusanLength = BuatFormPklDudiController.jurusan.value?.data?.length ?? 0;

          if (jurusanLength == 0) {
            AllMaterial.messageScaffold(
                title: "Tidak ada jurusan ditemukan!", context: context);
            return;
          }
          if (kuotaJurusanLength >= jurusanLength) {
            AllMaterial.messageScaffold(
                title: "Telah melewati jumlah jurusan!", context: context);
          } else {
            Get.to(() => const BuatFormPklDudiView(), arguments: {"id": 0});
            AllMaterial.box.write("isBuat", true);
          }
        },
      ),
    );
  }
}
