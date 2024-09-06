import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/homepage_siswa_controller.dart';

class HomepageSiswaView extends GetView<HomepageSiswaController> {
  const HomepageSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang, Siswa",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "NISN : 21414125125",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontRegular,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      tooltip: "Notifikasi",
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AllMaterial.colorBlue),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: AllMaterial.colorWhite,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(25),
                  width: Get.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AllMaterial.colorBlue,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/logo/opacity.png"),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Belum ada instansi yang dipilih",
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontSemiBold,
                          color: AllMaterial.colorWhite,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AllMaterial.colorWhite,
                          fixedSize: const Size.fromWidth(85),
                          elevation: 0,
                          foregroundColor: AllMaterial.colorBlue,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Pilih",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
