import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_siswa_dudi_controller.dart';

class DataSiswaDudiView extends GetView<DataSiswaDudiController> {
  const DataSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataSiswaDudiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DataSiswaDudiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
