import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/histori_absen_siswa_guru/views/histori_absen_siswa_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/widgets/profile_widgets.dart';

import '../controllers/detil_siswa_guru_controller.dart';

class DetilSiswaGuruView extends GetView<DetilSiswaGuruController> {
  const DetilSiswaGuruView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetilSiswaGuruController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        elevation: 0,
        title: Text(
          'Tentang ${AllMaterial.setiapHurufPertama((controller.siswa.value?.nama?.split(' ').length ?? 0) > 1 ? (controller.siswa.value?.nama?.split(' ')[0].length ?? 0) <= 2 ? controller.siswa.value?.nama?.split(' ')[1] ?? "Siswa" : controller.siswa.value?.nama?.split(' ')[0].replaceAll(".", "") ?? "Siswa" : controller.siswa.value?.nama ?? "Siswa")}',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: (controller.siswa.value?.fotoProfile != null)
                            ? NetworkImage(
                                controller.siswa.value!.fotoProfile
                                    .toString()
                                    .replaceAll("localhost", "103.56.148.178"),
                              )
                            : const AssetImage(
                                "assets/images/foto-profile.png",
                              ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                        width: 4,
                        color: AllMaterial.colorBlue,
                      ),
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            AllMaterial.formatNamaPanjang(
                                controller.siswa.value?.nama ?? ""),
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'NISN: ${controller.siswa.value?.nis ?? ""}',
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontRegular,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileWidget(
                    isEdit: false,
                    controller: controller,
                    textController: controller.kelasC,
                    title: "Kelas:",
                  ),
                  const SizedBox(height: 10),
                  ProfileWidget(
                    isEdit: false,
                    controller: controller,
                    textController: controller.noTelpC,
                    title: "No. Telepon:",
                  ),
                  const SizedBox(height: 10),
                  ProfileWidget(
                    isEdit: false,
                    controller: controller,
                    textController: controller.alamatC,
                    title: "Alamat Siswa:",
                  ),
                  const SizedBox(height: 10),
                  (controller.siswa.value?.dudi?.namaInstansiPerusahaan == null)
                      ? const SizedBox.shrink()
                      : ProfileWidget(
                          isEdit: false,
                          controller: controller,
                          textController: controller.instansiC,
                          title: "Tempat PKL:",
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: Get.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => const HistoriAbsenSiswaGuruView(), arguments: {
                    "nama": controller.siswa.value?.nama?.toString(),
                    "id": controller.siswa.value?.id,
                  });
                },
                icon: const Icon(
                  Icons.fingerprint,
                  color: AllMaterial.colorWhite,
                ),
                label: Text(
                  'Lacak Histori Absen',
                  style: AllMaterial.montSerrat(
                    fontWeight: AllMaterial.fontSemiBold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AllMaterial.colorBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: Get.width,
              child: OutlinedButton.icon(
                onPressed: () {
                  controller.bukaWhatsApp(controller.siswa.value?.noTelepon
                          ?.replaceAll("08", "62") ??
                      "");
                },
                icon: Icon(MdiIcons.whatsapp, color: AllMaterial.colorBlue),
                label: Text(
                  'Hubungi Siswa Ini',
                  style: AllMaterial.montSerrat(
                    fontWeight: AllMaterial.fontSemiBold,
                    color: AllMaterial.colorBlue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AllMaterial.colorBlue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: const BorderSide(
                    color: AllMaterial.colorBlue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
