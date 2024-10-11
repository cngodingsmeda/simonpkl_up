import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/detil_notifikasi_siswa_controller.dart';

class DetilNotifikasiSiswaView extends GetView<DetilNotifikasiSiswaController> {
  const DetilNotifikasiSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetilNotifikasiSiswaController());
    var id = Get.arguments;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Detil Notifikasi',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getNotifById(id["id"]),
          builder: (context, snapshot) {
            print("p: ${id["id"]}");
            print("c: ${id["jenis"]}");
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
