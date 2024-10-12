import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';

import '../controllers/batalkan_pkl_siswa_controller.dart';

class BatalkanPklSiswaView extends GetView<BatalkanPklSiswaController> {
  const BatalkanPklSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var id = Get.arguments;
    var controller = Get.put(BatalkanPklSiswaController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Batalkan PKL",
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pembatalan Ajuan PKL",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Instansi Terkait :",
                          style: AllMaterial.montSerrat(
                            fontSize: 15,
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.jurusanC,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorWhite,
                          ),
                          cursorColor: AllMaterial.colorWhite,
                          decoration: InputDecoration(
                            disabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AllMaterial.colorWhite,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            enabled: false,
                            hoverColor: AllMaterial.colorBlue,
                            focusColor: AllMaterial.colorBlue,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Alasan Pembatalan :",
                          style: AllMaterial.montSerrat(
                            fontSize: 15,
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          autofocus: true,
                          controller: controller.alasanC,
                          focusNode: controller.alasanF,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorWhite,
                          ),
                          cursorColor: AllMaterial.colorWhite,
                          onTapOutside: (_) {
                            controller.alasanF.unfocus();
                          },
                          decoration: InputDecoration(
                            hintText: "Masukkan alasan",
                            hintStyle: AllMaterial.montSerrat(
                              color: AllMaterial.colorWhite,
                              fontWeight: AllMaterial.fontMedium,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AllMaterial.colorWhite,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hoverColor: AllMaterial.colorBlue,
                            focusColor: AllMaterial.colorBlue,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.defaultDialog(
                          middleTextStyle: AllMaterial.montSerrat(),
                          backgroundColor: AllMaterial.colorWhite,
                          radius: 10,
                          buttonColor: AllMaterial.colorBlue,
                          titleStyle: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontMedium,
                          ),
                          title: "Konfirmasi",
                          middleText:
                              "Apakah Anda yakin ingin membatalkan ajuan PKL?",
                          onConfirm: () {
                            Get.back();
                            var batal = Get.put(HomepageSiswaController());
                            batal.batalkanPkl(
                                id["id"], controller.alasanC.text);
                          },
                          textCancel: "Batalkan",
                          cancelTextColor: AllMaterial.colorBlue,
                          textConfirm: "Konfirmasi",
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(Get.width),
                        disabledBackgroundColor:
                            AllMaterial.colorWhite.withOpacity(0.2),
                        shadowColor: Colors.transparent,
                        backgroundColor: AllMaterial.colorWhite,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Text(
                        "Batalkan PKL",
                        style: AllMaterial.montSerrat(
                          color: AllMaterial.colorBlue,
                          fontWeight: AllMaterial.fontSemiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

  // Get.defaultDialog(
  //   middleTextStyle: AllMaterial.montSerrat(),
  //   backgroundColor: AllMaterial.colorWhite,
  //   radius: 10,
  //   titleStyle: AllMaterial.montSerrat(
  //     fontWeight: AllMaterial.fontMedium,
  //   ),
  //   title: "Konfirmasi",
  //   middleText: "Apakah Anda yakin ingin membatalkan ajuan PKL?",
  //   cancel: TextButton(
  //     onPressed: () => Get.back(),
  //     child: Text(
  //       "Batalkan",
  //       style: AllMaterial.montSerrat(
  //         color: AllMaterial.colorBlue,
  //       ),
  //     ),
  //   ),
  //   confirm: TextButton(
  //     onPressed: () {
  //       Get.back();
  //       var batal = Get.put(HomepageSiswaController());
  //       batal.batalkanPkl(id["id"], controller.alasanC.text);
  //     },
  //     child: Text(
  //       "Konfirmasi",
  //       style: AllMaterial.montSerrat(
  //         color: Colors.white,
  //       ),
  //     ),
  //   ),
  // );
