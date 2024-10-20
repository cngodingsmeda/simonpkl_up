import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/detil_siswa_guru/controllers/detil_siswa_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/homepage_guru/controllers/homepage_guru_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/siswa_bimbingan_guru_controller.dart';

class SiswaBimbinganGuruView extends GetView<SiswaBimbinganGuruController> {
  const SiswaBimbinganGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Siswa Bimbingan',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                var homeCont = Get.put(HomepageGuruController());
                if (homeCont.siswaBimbingan.value == null ||
                    homeCont.siswaBimbingan.value!.data!.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25),
                      Center(
                        child: Text(
                          "Belum ada siswa bimbingan",
                          style: AllMaterial.montSerrat(),
                        ),
                      ),
                    ],
                  );
                }
                var siswaList = homeCont.siswaBimbingan.value!.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: siswaList.length,
                  itemBuilder: (context, index) {
                    var siswa = siswaList[index];
                    return CardWidget(
                      onTap: () {
                        var detilSiswa = Get.put(DetilSiswaGuruController());
                        detilSiswa.getDetilSiswaById(siswa.id ?? 0);
                      },
                      tanggal: AllMaterial.setiapNamaHurufPertama(siswa.nama),
                      icon: CircleAvatar(
                        onBackgroundImageError: (exception, stackTrace) {
                          const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.grey,
                          );
                        },
                        backgroundColor: const Color(0xffF8F8F8),
                        backgroundImage: (siswa.fotoProfile != null)
                            ? NetworkImage(
                                siswa.fotoProfile!
                                    .replaceAll("localhost", "10.0.2.2"),
                              )
                            : const AssetImage("assets/images/foto-profile.png")
                                as ImageProvider,
                        child: (siswa.fotoProfile == null)
                            ? SvgPicture.asset("assets/icons/person.svg")
                            : null,
                      ),
                      keterangan: siswa.kelas!.nama!,
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
