import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/histori_absen_siswa_dudi/views/histori_absen_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/widgets/profile_widgets.dart';

import '../controllers/detil_siswa_dudi_controller.dart';

class DetilSiswaDudiView extends GetView<DetilSiswaDudiController> {
  const DetilSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetilSiswaDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        elevation: 0,
        title: Text(
          'Tentang ${AllMaterial.setiapHurufPertama((controller.siswa.value?.data?.nama?.split(' ').length ?? 0) > 1 ? (controller.siswa.value?.data?.nama?.split(' ')[0].length ?? 0) <= 3 && controller.siswa.value!.data!.nama!.contains(".") ? controller.siswa.value?.data?.nama?.split(' ')[1] ?? "Siswa" : controller.siswa.value?.data?.nama?.split(' ')[0].replaceAll(".", "") ?? "Siswa" : controller.siswa.value?.data?.nama ?? "Siswa")}',
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
                        image:
                            (controller.siswa.value?.data?.fotoProfile != null)
                                ? NetworkImage(
                                    controller.siswa.value!.data!.fotoProfile
                                        .toString()
                                        .replaceAll("localhost", "10.0.2.2"),
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
                                controller.siswa.value?.data?.nama ?? ""),
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontBold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'NIS: ${controller.siswa.value?.data?.nis ?? ""}',
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
                    controller: controller,
                    textController: controller.kelasC,
                    title: "Kelas:",
                  ),
                  const SizedBox(height: 10),
                  ProfileWidget(
                    controller: controller,
                    textController: controller.noTelpC,
                    title: "No. Telepon:",
                  ),
                  const SizedBox(height: 10),
                  ProfileWidget(
                    controller: controller,
                    textController: controller.alamatC,
                    title: "Alamat:",
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
                  Get.to(() => const HistoriAbsenSiswaDudiView(), arguments: {
                    "nama": controller.siswa.value?.data?.nama?.toString(),
                    "id": controller.siswa.value?.data?.id,
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
                  controller.bukaWhatsApp(controller
                          .siswa.value?.data?.noTelepon
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
