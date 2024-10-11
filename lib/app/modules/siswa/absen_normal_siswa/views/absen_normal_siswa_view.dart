import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';

import '../controllers/absen_normal_siswa_controller.dart';

class AbsenNormalSiswaView extends GetView<AbsenNormalSiswaController> {
  const AbsenNormalSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AbsenNormalSiswaController());
    var arg = Get.arguments;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Absen ${AllMaterial.setiapHurufPertama(arg["status"])}',
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: AllMaterial.colorBlue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 450,
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10 September 2024 - 8:11:46 AM",
                          style: AllMaterial.montSerrat(
                            color: AllMaterial.colorWhite,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.selectedImagePath.value == null) {
                              controller.showImageSourceDialog(context);
                            } else {
                              null;
                            }
                          },
                          child: Obx(
                            () => DottedBorder(
                              color:
                                  (controller.selectedImagePath.value == null)
                                      ? AllMaterial.colorWhite
                                      : Colors.transparent,
                              strokeWidth: 2,
                              dashPattern: const [6, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              child: Container(
                                height: 250,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Obx(() {
                                  return controller.selectedImagePath.value ==
                                          null
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.camera_alt_outlined,
                                              color: AllMaterial.colorWhite,
                                              size: 50,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Tap untuk pilih gambar',
                                              style: AllMaterial.montSerrat(
                                                color: AllMaterial.colorWhite,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                controller
                                                    .selectedImagePath.value!,
                                              ),
                                            ),
                                          ),
                                          width: Get.width,
                                          height: Get.height,
                                        );
                                }),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => ElevatedButton(
                            onPressed:
                                (controller.selectedImagePath.value != null)
                                    ? () {
                                        bool diLuarRadius = arg["diLuarRadius"];
                                        if (diLuarRadius) {
                                          controller.postAbsenMasuk(
                                            arg["latitude"],
                                            arg["longitude"],
                                            controller.selectedImagePath.value!,
                                            ApiUrl.urlPostAbsenLuarRadiusSiswa,
                                            context,
                                            arg["status"],
                                          );
                                        } else {
                                          controller.postAbsenMasuk(
                                            arg["latitude"],
                                            arg["longitude"],
                                            controller.selectedImagePath.value!,
                                            (arg["status"])
                                                    .toString()
                                                    .contains("pulang")
                                                ? ApiUrl.urlPostAbsenPulangSiswa
                                                : ApiUrl.urlPostAbsenMasukSiswa,
                                            context,
                                            arg["status"],
                                          );
                                        }
                                      }
                                    : null,
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
                              "Absen ${AllMaterial.setiapHurufPertama(arg["status"])}",
                              style: AllMaterial.montSerrat(
                                color: AllMaterial.colorBlue,
                                fontWeight: AllMaterial.fontSemiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
