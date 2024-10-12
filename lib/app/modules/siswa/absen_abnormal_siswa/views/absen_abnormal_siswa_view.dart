import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/absen_abnormal_siswa/controllers/absen_abnormal_siswa_controller.dart';

class AbsenAbnormalSiswaView extends GetView<AbsenAbnormalSiswaController> {
  const AbsenAbnormalSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
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
                      AllMaterial.ubahTanggaldanJam(
                        DateTime.now().toIso8601String(),
                      ),
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
                          "Alasan Izin :",
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
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorWhite,
                          ),
                          cursorColor: AllMaterial.colorBlue,
                          autocorrect: false,
                          onTapOutside: (_) {
                            controller.inputF.unfocus();
                          },
                          enableSuggestions: true,
                          decoration: InputDecoration(
                            hintText: "Masukkan alasan ${arg["status"]}",
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
                          "Bukti Dokumen (Opsional) :",
                          style: AllMaterial.montSerrat(
                            fontSize: 15,
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            final file = controller.selectedFile.value;
                            if (file != null) {
                              if (file.path.endsWith('.jpg') ||
                                  file.path.endsWith('.png') ||
                                  file.path.endsWith('.jpeg')) {
                                previewImage(file, context);
                              } else if (file.path.endsWith('.pdf') ||
                                  file.path.endsWith('.doc') ||
                                  file.path.endsWith('.docx')) {
                                controller.openFile(file);
                              }
                            } else {
                              controller.pickDocument(context);
                            }
                          },
                          child: Obx(
                            () {
                              if (controller.selectedFile.value != null) {
                                final file = controller.selectedFile.value!;
                                if (file.path.endsWith('.jpg') ||
                                    file.path.endsWith('.png') ||
                                    file.path.endsWith('.jpeg')) {
                                  return previewImage(file, context);
                                } else {
                                  return previewOtherFile(file);
                                }
                              } else {
                                return uploadFilePlaceholder();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        (arg["status"].toString().contains("izin"))
                            ? Obx(
                                () {
                                  print(controller.isSakit.value);
                                  return GestureDetector(
                                    onTap: () => controller.isSakit.toggle(),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          fillColor:
                                              const WidgetStatePropertyAll(
                                            AllMaterial.colorBlue,
                                          ),
                                          value: controller.isSakit.value,
                                          onChanged: (value) {
                                            controller.isSakit.value = value!;
                                          },
                                          checkColor: Colors.white,
                                          side: const BorderSide(
                                              color: AllMaterial.colorWhite,
                                              width: 2),
                                          activeColor: Colors.white,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Tandai sebagai "Absen Sakit"',
                                            style: AllMaterial.montSerrat(
                                              color: AllMaterial.colorWhite,
                                              fontWeight:
                                                  AllMaterial.fontMedium,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 10),
                        Obx(
                          () => ElevatedButton(
                            onPressed: (controller.selectedFile.value != null)
                                ? () {
                                    if (controller.inputC.text != "") {
                                      controller.postAbsenTelat(
                                        arg["latitude"],
                                        arg["longitude"],
                                        controller.selectedFile.value!,
                                        controller.inputC.text,
                                        arg["status"],
                                        context,
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
                              "Kirim Absen ${AllMaterial.setiapHurufPertama(arg["status"])}",
                              style: AllMaterial.montSerrat(
                                color: AllMaterial.colorBlue,
                                fontWeight: AllMaterial.fontSemiBold,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget previewImage(File file, BuildContext context) {
    PhotoViewController photoViewController = PhotoViewController();

    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: Colors.black.withOpacity(0.9),
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    PhotoView(
                      controller: photoViewController,
                      imageProvider: FileImage(file),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      initialScale: PhotoViewComputedScale.contained,
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      enableRotation: true,
                      loadingBuilder: (context, event) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      onScaleEnd: (context, details, controllerValue) {
                        if (controllerValue.scale != null &&
                            controllerValue.scale! <= 1.0) {
                          Get.back();
                        }
                      },
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: AllMaterial.colorWhite,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.file(
                  file,
                  fit: BoxFit.cover,
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                file.path.split('/').last.toString().split(' ').join('-'),
                overflow: TextOverflow.ellipsis,
                style: AllMaterial.montSerrat(
                  color: AllMaterial.colorWhite,
                  fontWeight: AllMaterial.fontMedium,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.selectedFile.value = null;
              },
              icon: const Icon(
                Icons.clear,
                size: 20,
                color: AllMaterial.colorWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget previewOtherFile(File file) {
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
        children: [
          const Icon(Icons.description, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              controller.selectedFile.value!.path
                  .split('/')
                  .last
                  .toString()
                  .split(' ')
                  .join('-'),
              overflow: TextOverflow.ellipsis,
              style: AllMaterial.montSerrat(
                color: AllMaterial.colorWhite,
                fontWeight: AllMaterial.fontMedium,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.selectedFile.value = null;
            },
            icon: const Icon(
              Icons.clear_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget uploadFilePlaceholder() {
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
        child: Column(
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
        ),
      ),
    );
  }
}
