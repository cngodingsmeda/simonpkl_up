import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/menunggu_verifikasi_pkl_siswa_dudi_controller.dart';

class MenungguVerifikasiPklSiswaDudiView
    extends GetView<MenungguVerifikasiPklSiswaDudiController> {
  const MenungguVerifikasiPklSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenungguVerifikasiPklSiswaDudiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MenungguVerifikasiPklSiswaDudiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
