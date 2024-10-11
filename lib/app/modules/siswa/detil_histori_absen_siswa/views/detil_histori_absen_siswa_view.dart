import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/absen_abnormal_siswa/controllers/absen_abnormal_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/controllers/detil_histori_absen_siswa_controller.dart';

class DetilHistoriAbsenSiswaView
    extends GetView<DetilHistoriAbsenSiswaControllr> {
  const DetilHistoriAbsenSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    final DetilHistoriAbsenSiswaControllr controller =
        Get.put(DetilHistoriAbsenSiswaControllr());
    final AbsenAbnormalSiswaController absen =
        Get.put(AbsenAbnormalSiswaController());
    controller.buktiDokumen = absen.selectedFile;
    PhotoViewController photoViewController = PhotoViewController();
    var arg = Get.arguments;

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: AllMaterial.colorBlue,
                  ),
                ),
              ],
            );
          } else {
            var absensi = controller.detilAbsen.value;
            return SingleChildScrollView(
              child: Stack(
                children: [
                  ClipPath(
                    clipper: ClipPathClass(),
                    child: Container(
                      height: 300,
                      width: Get.width,
                      color: AllMaterial.colorBlue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/absen.svg"),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                absensi == null
                                    ? "Gheral"
                                    : AllMaterial.ubahHari(
                                        absensi.tanggal.toIso8601String()),
                                style: AllMaterial.montSerrat(
                                  color: AllMaterial.colorWhite,
                                  fontSize: 20,
                                  fontWeight: AllMaterial.fontSemiBold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Jenis Absen : Absen ${arg["jenis"].toString().contains("pulang") ? "Pulang" : "Masuk"}",
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorWhite,
                              fontSize: 15,
                              fontWeight: AllMaterial.fontRegular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 250),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AllMaterial.colorWhite,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(34, 63, 63, 63),
                                  offset: Offset(5, 5),
                                  blurRadius: 25,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Status Absen:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    arg["jenis"].toString().contains("masuk")
                                        ? absensi?.keteranganAbsenMasuk
                                                    ?.insideRadius ??
                                                false
                                            ? "Di dalam radius"
                                            : "Di luar radius"
                                        : absensi?.keteranganAbsenPulang
                                                    ?.insideRadius ??
                                                false
                                            ? "Di dalam radius"
                                            : "Di luar radius",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Waktu Absen:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    AllMaterial.ubahJamMenitDetik((arg["jenis"]
                                            .toString()
                                            .contains("pulang"))
                                        ? absensi?.absenPulang ??
                                            "Waktu tidak tersedia"
                                        : (arg["jenis"]
                                                .toString()
                                                .contains("masuk"))
                                            ? absensi?.absenMasuk ??
                                                "Waktu tidak tersedia"
                                            : "07:23:06.499606"),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                if (arg["status"].toString().contains("izin") ||
                                    arg["status"].toString().contains("sakit"))
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 15,
                                    ),
                                    title: Text(
                                      "Keterangan Absen:",
                                      style: AllMaterial.montSerrat(
                                        fontSize: 13,
                                      ),
                                    ),
                                    subtitle: Text(
                                      arg["jenis"].toString().contains("masuk")
                                          ? AllMaterial.hurufPertama(absensi!
                                                  .keteranganAbsenMasuk?.note ??
                                              "Tidak ada catatan")
                                          : AllMaterial.hurufPertama(
                                              absensi!.keteranganAbsenPulang
                                                      ?.note ??
                                                  "Tidak ada catatan",
                                            ),
                                      style: AllMaterial.montSerrat(
                                        fontSize: 16,
                                        fontWeight: AllMaterial.fontBold,
                                      ),
                                    ),
                                  ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Keterangan Waktu:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    (absensi!.keteranganAbsenMasuk?.note !=
                                                    null &&
                                                absensi.keteranganAbsenMasuk
                                                        ?.note !=
                                                    "") ||
                                            (absensi.keteranganAbsenPulang
                                                        ?.note !=
                                                    null &&
                                                absensi.keteranganAbsenPulang
                                                        ?.note !=
                                                    "")
                                        ? "Tepat Waktu"
                                        : "Telat",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Instansi terkait:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    absensi.siswa.dudi.namaInstansiPerusahaan,
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Jam Ditentukan:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${AllMaterial.formatJam(absensi.jadwalHari.batasAbsenMasuk ?? "Tidak tersedia")} - ${AllMaterial.formatJam(absensi.jadwalHari.batasAbsenPulang ?? "Tidak tersedia")}",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                if (absensi.fotoAbsenMasuk != null &&
                                        absensi.fotoAbsenMasuk!.isNotEmpty ||
                                    absensi.fotoAbsenPulang != null &&
                                        absensi.fotoAbsenPulang!.isNotEmpty)
                                  ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 15,
                                    ),
                                    title: Text(
                                      "Bukti Dokumen:",
                                      style: AllMaterial.montSerrat(
                                        fontSize: 13,
                                      ),
                                    ),
                                    subtitle: Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            barrierColor:
                                                Colors.black.withOpacity(0.9),
                                            context: context,
                                            builder: (context) =>
                                                StatefulBuilder(
                                              builder: (context, setState) {
                                                return Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Stack(
                                                    children: [
                                                      PhotoView(
                                                        controller:
                                                            photoViewController,
                                                        imageProvider:
                                                            NetworkImage(
                                                          arg["jenis"]
                                                                  .toString()
                                                                  .contains(
                                                                      "masuk")
                                                              ? absensi
                                                                  .fotoAbsenMasuk!
                                                                  .replaceAll(
                                                                      "localhost",
                                                                      "10.0.2.2")
                                                              : absensi
                                                                  .fotoAbsenPulang!
                                                                  .replaceAll(
                                                                      "localhost",
                                                                      "10.0.2.2"),
                                                        ),
                                                        minScale:
                                                            PhotoViewComputedScale
                                                                .contained,
                                                        maxScale:
                                                            PhotoViewComputedScale
                                                                    .covered *
                                                                2,
                                                        initialScale:
                                                            PhotoViewComputedScale
                                                                .contained,
                                                        backgroundDecoration:
                                                            const BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        enableRotation: true,
                                                        loadingBuilder:
                                                            (context, event) =>
                                                                const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                        onScaleEnd: (context,
                                                            details,
                                                            controllerValue) {
                                                          if (controllerValue
                                                                      .scale !=
                                                                  null &&
                                                              controllerValue
                                                                      .scale! <=
                                                                  1.0) {
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
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.network(
                                                arg["jenis"]
                                                        .toString()
                                                        .contains("masuk")
                                                    ? absensi.fotoAbsenMasuk!
                                                        .replaceAll("localhost",
                                                            "10.0.2.2")
                                                    : absensi.fotoAbsenPulang!
                                                        .replaceAll("localhost",
                                                            "10.0.2.2"),
                                                fit: BoxFit.cover,
                                                width: 35,
                                                height: 35,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return const Icon(
                                                      Icons.error);
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Expanded(
                                              child: Text(
                                                arg["jenis"]
                                                        .toString()
                                                        .contains("masuk")
                                                    ? absensi.fotoAbsenMasuk!
                                                        .split('/')
                                                        .last
                                                        .toString()
                                                        .split(' ')
                                                        .join('-')
                                                    : absensi.fotoAbsenPulang!
                                                        .split('/')
                                                        .last
                                                        .toString()
                                                        .split(' ')
                                                        .join('-'),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: AllMaterial.montSerrat(
                                                  color: Colors.black87
                                                      .withOpacity(0.7),
                                                  fontWeight:
                                                      AllMaterial.fontMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: AllMaterial.colorBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          width: Get.width,
          height: 50,
          child: Center(
            child: Text(
              "Kembali Ke Beranda",
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontSemiBold,
                color: AllMaterial.colorWhite,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget previewImage(String file, BuildContext context) {
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
                    imageProvider: NetworkImage(file),
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
              child: Image.network(
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
              file.split('/').last.toString().split(' ').join('-'),
              overflow: TextOverflow.ellipsis,
              style: AllMaterial.montSerrat(
                color: AllMaterial.colorWhite,
                fontWeight: AllMaterial.fontMedium,
              ),
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
            // controller.selectedFile.value!.path
            //     .split('/')
            //     .last
            //     .toString()
            //     .split(' ')
            //     .join('-'),
            "",
            overflow: TextOverflow.ellipsis,
            style: AllMaterial.montSerrat(
              color: AllMaterial.colorWhite,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
        ),
      ],
    ),
  );
}
