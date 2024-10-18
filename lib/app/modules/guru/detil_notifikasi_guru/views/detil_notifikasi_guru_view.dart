import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/detil_notifikasi_guru_controller.dart';

class DetilNotifikasiGuruView extends GetView<DetilNotifikasiGuruController> {
  const DetilNotifikasiGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilNotifikasiGuruController());
    var id = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detil Notifikasi'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getNotifById(id["id"]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      color: AllMaterial.colorBlue,
                    ),
                  ),
                ],
              );
            }
            var notif = controller.detilNotif.value;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AllMaterial.ubahTanggaldanJam(notif!.createdAt.toString()),
                    style: AllMaterial.montSerrat(
                      color: AllMaterial.colorGrey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    AllMaterial.setiapHurufPertama(notif.title),
                    style: AllMaterial.montSerrat(
                      color: AllMaterial.colorBlack,
                      fontSize: 18,
                      fontWeight: AllMaterial.fontBold,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    notif.body,
                    style: AllMaterial.montSerrat(
                      color: AllMaterial.colorBlack,
                      fontSize: 13,
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
