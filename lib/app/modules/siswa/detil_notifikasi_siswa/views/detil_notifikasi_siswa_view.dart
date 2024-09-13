import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/detil_notifikasi_siswa_controller.dart';

class DetilNotifikasiSiswaView extends GetView<DetilNotifikasiSiswaController> {
  const DetilNotifikasiSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "18 September 2024 - 13.48",
              style: AllMaterial.montSerrat(
                color: AllMaterial.colorGrey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Kabar baik untukmu!",
              style: AllMaterial.montSerrat(
                color: AllMaterial.colorBlack,
                fontSize: 16,
                fontWeight: AllMaterial.fontBold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              "Ajuan PKL-mu yang telah Anda ajukan telah diterima di PT. Telkom Indonesia, Selamat bergabung!",
              style: AllMaterial.montSerrat(
                color: AllMaterial.colorBlack,
                fontSize: 12,
                fontWeight: AllMaterial.fontMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
