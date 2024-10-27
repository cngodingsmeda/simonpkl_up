import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/detil_siswa_dudi/controllers/detil_siswa_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/homepage_dudi/controllers/homepage_dudi_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/data_siswa_dudi_controller.dart';

class DataSiswaDudiView extends GetView<DataSiswaDudiController> {
  const DataSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DataSiswaDudiController());
    final homeC = Get.put(HomepageDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Data Siswa PKL',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () {
            if (DataSiswaDudiController.allSiswa.value != null) {
              if (DataSiswaDudiController.allSiswa.value!.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: homeC.jumlahSiswa.value,
                  itemBuilder: (context, index) {
                    var siswa =
                        DataSiswaDudiController.allSiswa.value?.data?[index];
                    return CardWidget(
                      onTap: () {
                        var detilSiswa = Get.put(DetilSiswaDudiController());
                        detilSiswa.getDetilSiswaById(siswa?.id ?? 0);
                      },
                      tanggal:
                          AllMaterial.setiapNamaHurufPertama(siswa?.nama ?? ""),
                      icon: CircleAvatar(
                        backgroundColor: const Color(0xffF8F8F8),
                        backgroundImage: (siswa?.fotoProfile != null)
                            ? NetworkImage(
                                siswa!.fotoProfile!
                                    .replaceAll("localhost", "10.0.2.2"),
                              )
                            : const AssetImage("assets/images/foto-profile.png")
                                as ImageProvider,
                        child: (siswa?.fotoProfile == null)
                            ? SvgPicture.asset("assets/icons/person.svg")
                            : null,
                      ),
                      keterangan: siswa?.kelas?.nama ?? "",
                    );
                  },
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Tidak ada data siswa...",
                        style: AllMaterial.montSerrat(),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Belum ada data siswa...",
                      style: AllMaterial.montSerrat(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
