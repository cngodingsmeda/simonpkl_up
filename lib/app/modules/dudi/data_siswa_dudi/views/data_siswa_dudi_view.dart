import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/detil_siswa_dudi/views/detil_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/data_siswa_dudi_controller.dart';

class DataSiswaDudiView extends GetView<DataSiswaDudiController> {
  const DataSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Data Siswa PKL',
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
              CardWidget(
                onTap: () => Get.to(() => const DetilSiswaDudiView()),
                tanggal: "Aditya Putra Budiman",
                icon: CircleAvatar(
                  backgroundColor: const Color(0xffF8F8F8),
                  child: SvgPicture.asset(
                    "assets/icons/person.svg",
                  ),
                ),
                keterangan: "XI RPL 1",
              ),
              CardWidget(
                onTap: () => Get.to(() => const DetilSiswaDudiView()),
                tanggal: "Gheral Deva Bagus Archana",
                icon: CircleAvatar(
                  backgroundColor: const Color(0xffF8F8F8),
                  child: SvgPicture.asset(
                    "assets/icons/person.svg",
                  ),
                ),
                keterangan: "XI RPL 2",
              ),
              CardWidget(
                onTap: () => Get.to(() => const DetilSiswaDudiView()),
                tanggal: "Fauzan Azka Al-Haqi",
                icon: CircleAvatar(
                  backgroundColor: const Color(0xffF8F8F8),
                  child: SvgPicture.asset(
                    "assets/icons/person.svg",
                  ),
                ),
                keterangan: "XI RPL 3",
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
