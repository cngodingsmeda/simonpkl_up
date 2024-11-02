import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/data_siswa_dudi/controllers/data_siswa_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';
import 'package:simon_pkl/app/modules/siswa/buat_laporan_siswa/views/buat_laporan_siswa_view.dart';

import '../controllers/buat_laporan_pkl_dudi_controller.dart';

class BuatLaporanPklDudiView extends GetView<BuatLaporanPklDudiController> {
  const BuatLaporanPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isKendala = LaporanPklDudiController.isKendala.value;
    var controller = Get.put(BuatLaporanPklDudiController());
    var siswa = DataSiswaDudiController.allSiswa.value;
    print(siswa);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          !isKendala ? 'Laporan PKL' : "Kendala PKL",
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
                      !isKendala
                          ? "Kegiatan Saya Hari Ini"
                          : "Kendala Selama PKL",
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
                          !isKendala
                              ? "Topik Pekerjaan :"
                              : "Kendala Terkait :",
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
                          cursorColor: AllMaterial.colorWhite,
                          onTapOutside: (_) {
                            controller.inputF.unfocus();
                            controller.inputAtas.value = controller.inputC.text;
                          },
                          decoration: InputDecoration(
                            hintText: !isKendala
                                ? "Masukkan topik pekerjaan"
                                : "Masukkan kendala terkait",
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
                          !isKendala
                              ? "Rujukan Kompetensi Dasar :"
                              : "Deskripsi Kendala :",
                          style: AllMaterial.montSerrat(
                            fontSize: 15,
                            color: AllMaterial.colorWhite,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: controller.topikC,
                          focusNode: controller.topikF,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontMedium,
                            color: AllMaterial.colorWhite,
                          ),
                          cursorColor: AllMaterial.colorWhite,
                          onTapOutside: (_) {
                            controller.topikF.unfocus();
                            controller.inputBawah.value =
                                controller.topikC.text;
                          },
                          decoration: InputDecoration(
                            hintText: !isKendala
                                ? "Masukkan rujukan kompetensi dasar"
                                : "Masukkan deskripsi kendala",
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
                        isKendala
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    "Siswa Terkait :",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 15,
                                      color: AllMaterial.colorWhite,
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  DropdownButtonFormField<String>(
                                    dropdownColor: AllMaterial.colorBlue,
                                    elevation: 0,
                                    value: null,
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorWhite,
                                    ),
                                    iconEnabledColor: AllMaterial.colorWhite,
                                    onChanged: (String? selectedId) {
                                      if (selectedId != null) {
                                        print(
                                            "ID Siswa yang dipilih: $selectedId");
                                        controller.selectedSiswaId.value =
                                            selectedId;
                                      }
                                    },
                                    items: siswa?.data
                                        ?.map<DropdownMenuItem<String>>(
                                            (siswa) {
                                      return DropdownMenuItem<String>(
                                        value: siswa.id.toString(),
                                        child: Text(
                                          siswa.nama == ""
                                              ? ""
                                              : AllMaterial
                                                  .setiapNamaHurufPertama(
                                                  siswa.nama,
                                                ),
                                          style: AllMaterial.montSerrat(
                                            fontWeight: AllMaterial.fontMedium,
                                            color: AllMaterial.colorWhite,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    decoration: InputDecoration(
                                      hintStyle: AllMaterial.montSerrat(
                                        color: AllMaterial.colorWhite,
                                        fontWeight: AllMaterial.fontMedium,
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: AllMaterial.colorWhite,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 20),
                        Text(
                          "Dokumentasi (Opsional) :",
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
                                showDialog(
                                  barrierColor: Colors.black.withOpacity(0.6),
                                  context: context,
                                  builder: (context) => Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return FutureBuilder(
                                          future: getImageSize(file),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                    ConnectionState.done &&
                                                snapshot.hasData) {
                                              // ignore: unused_local_variable
                                              final imageSize = snapshot.data!;
                                              return PhotoView(
                                                imageProvider: FileImage(file),
                                                minScale: PhotoViewComputedScale
                                                    .contained,
                                                maxScale: PhotoViewComputedScale
                                                        .covered *
                                                    2,
                                                basePosition: Alignment.center,
                                                enableRotation: false,
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              } else if (file.path.endsWith('.pdf') ||
                                  file.path.endsWith('.doc') ||
                                  file.path.endsWith('.docx')) {
                                controller.openFile(file);
                              }
                            } else {
                              controller.pickDocument();
                            }
                          },
                          child: Obx(
                            () {
                              if (controller.selectedFile.value != null) {
                                final file = controller.selectedFile.value!;
                                if (file.path.endsWith('.jpg') ||
                                    file.path.endsWith('.png') ||
                                    file.path.endsWith('.jpeg')) {
                                  return previewImage(file);
                                } else {
                                  return previewOtherFile(file);
                                }
                              } else {
                                return uploadFilePlaceholder();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                        Obx(
                          () => ElevatedButton(
                            onPressed: (controller.inputAtas.value != "" ||
                                    controller.inputBawah.value != "" ||
                                    controller.selectedSiswaId.value != "")
                                ? () {
                                    AllMaterial.cusDialogValidasi(
                                      title: "Membuat Laporan",
                                      subtitle: "Apakah Anda yakin?",
                                      onConfirm: () {
                                        if (isKendala) {
                                          if (controller
                                                  .selectedSiswaId.value !=
                                              "") {
                                            controller.postLaporanKendalaDudi(
                                              context,
                                            );
                                          } else {
                                            AllMaterial.messageScaffold(
                                              title: AllMaterial.hurufPertama(
                                                "Harap pilih siswa terkait",
                                              ),
                                              context: context,
                                            );
                                          }
                                        } else {
                                          controller
                                              .postLaporanHarianDudi(context);
                                        }
                                        Get.back();
                                      },
                                      onCancel: () => Get.back(),
                                    );
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
                              !isKendala ? "Kirim Laporan" : "Kirim Kendala",
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
}

Future<Size> getImageSize(File file) async {
  final completer = Completer<Size>();
  final image = Image.file(file);
  image.image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
      completer.complete(
        Size(
          imageInfo.image.width.toDouble(),
          imageInfo.image.height.toDouble(),
        ),
      );
    }),
  );
  return completer.future;
}

Widget previewImage(File file) {
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
            controller.selectedFile.value?.path
                    .split('/')
                    .last
                    .toString()
                    .split(' ')
                    .join('-') ??
                "",
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
          SvgPicture.asset(
            "assets/icons/lokasi.svg",
            height: 40,
          ),
          const SizedBox(height: 10),
          Text(
            "tekan untuk memilih lokasi",
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
