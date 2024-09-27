import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verifikasi_selesai_pkl_siswa_dudi_controller.dart';

class VerifikasiSelesaiPklSiswaDudiView
    extends GetView<VerifikasiSelesaiPklSiswaDudiController> {
  const VerifikasiSelesaiPklSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VerifikasiSelesaiPklSiswaDudiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VerifikasiSelesaiPklSiswaDudiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
