import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/laporan_siswa_guru_controller.dart';

class LaporanSiswaGuruView extends GetView<LaporanSiswaGuruController> {
  const LaporanSiswaGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: const Text('LaporanSiswaGuruView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LaporanSiswaGuruView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
