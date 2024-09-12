import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/absen_abnormal_siswa_controller.dart';

class AbsenAbnormalSiswaView extends GetView<AbsenAbnormalSiswaController> {
  const AbsenAbnormalSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AbsenAbnormalSiswaController());
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Absen Izin',
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
                      "10 September 2024 - 8:11:46 AM",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const SizedBox(height: 10),
                        Text(
                          "Alasan Izin",
                          style: AllMaterial.montSerrat(
                            fontSize: 15,
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.inputC,
                          focusNode: controller.inputF,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontRegular,
                            color: AllMaterial.colorWhite,
                          ),
                          cursorColor: AllMaterial.colorBlue,
                          autocorrect: false,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                            hintText: "Masukkan alasan izin",
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
                        const SizedBox(height: 20),
                        Text(
                          "Bukti Dokumen (Opsional)",
                          style: AllMaterial.montSerrat(
                            fontSize: 15,
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Obx(
                          () => GestureDetector(
                            onTap: (controller.selectedFile.value == null)
                                ? () {
                                    controller.pickDocument();
                                  }
                                : null,
                            child: Obx(() {
                              if (controller.selectedFile.value != null) {
                                final file = controller.selectedFile.value!;
                                if (file.path.endsWith('.jpg') ||
                                    file.path.endsWith('.png') ||
                                    file.path.endsWith('.jpeg')) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: AllMaterial.colorWhite,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              25,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              file,
                                              fit: BoxFit.contain,
                                              width: 35,
                                              height: 35,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          file.path.split('/').last,
                                          style: AllMaterial.montSerrat(
                                            color: AllMaterial.colorWhite,
                                            fontWeight: AllMaterial.fontMedium,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  return DottedBorder(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                    dashPattern: const [6, 3],
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(15),
                                    child: Container(
                                      width: Get.width,
                                      height: 150,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "File: ${file.path.split('/').last}",
                                        style: AllMaterial.montSerrat(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.file_upload,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "docx, pdf, jpg, atau png",
                                      style: AllMaterial.montSerrat(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              }
                            }),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                    // Tombol Absen Masuk
                    Obx(
                      () => ElevatedButton(
                        onPressed: (controller.selectedFile.value != null)
                            ? () {
                                print(
                                    "Alasan Izin: ${controller.alasanIzin.value}");
                                if (controller.selectedFile.value != null) {
                                  print(
                                    "Dokumen: ${controller.selectedFile.value!.path}",
                                  );
                                }
                                controller.selectedFile.value = null;
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
                          "Absen Masuk",
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
          ),
        ),
      ),
    );
  }
}
