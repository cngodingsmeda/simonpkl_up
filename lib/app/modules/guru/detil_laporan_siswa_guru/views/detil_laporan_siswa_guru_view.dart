import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:photo_view/photo_view.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';

import '../controllers/detil_laporan_siswa_guru_controller.dart';

class DetilLaporanSiswaGuruView
    extends GetView<DetilLaporanSiswaGuruController> {
  const DetilLaporanSiswaGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetilLaporanSiswaGuruController());
    var isKendalaSiswa = DetilLaporanSiswaGuruController.isKendalaSiswa.value;
    PhotoViewController photoViewController = PhotoViewController();
    void openFile(String file) async {
      await OpenFile.open(file);
    }

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(child: Obx(
        () {
          String fileLaporan =
              controller.laporan.value?.data?.dokumentasi ?? "";
          String fileKendala =
              controller.kendala.value?.data?.fileLaporan ?? "";
          return Obx(
            () => Stack(
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
                        SvgPicture.asset("assets/icons/laporan.svg"),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: Get.width,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Laporan ${isKendalaSiswa ? "Kendala" : "Harian"}",
                                style: AllMaterial.montSerrat(
                                  color: AllMaterial.colorWhite,
                                  fontSize: 20,
                                  fontWeight: AllMaterial.fontSemiBold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Oleh : ${AllMaterial.setiapHurufPertama(isKendalaSiswa ? controller.kendala.value?.data?.siswa?.nama ?? "" : controller.laporan.value?.data?.siswa?.nama ?? "")}",
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
                                title: (isKendalaSiswa)
                                    ? Text(
                                        "Kendala Terkait:",
                                        style: AllMaterial.montSerrat(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        "Topik Pekerjaan:",
                                        style: AllMaterial.montSerrat(
                                          fontSize: 13,
                                        ),
                                      ),
                                subtitle: (isKendalaSiswa)
                                    ? Text(
                                        AllMaterial.hurufPertama(
                                          controller.kendala.value?.data
                                                  ?.kendala ??
                                              "",
                                        ),
                                        style: AllMaterial.montSerrat(
                                          fontSize: 16,
                                          fontWeight: AllMaterial.fontBold,
                                        ),
                                      )
                                    : Text(
                                        AllMaterial.hurufPertama(
                                          controller.laporan.value?.data
                                                  ?.topikPekerjaan ??
                                              "",
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
                                title: (isKendalaSiswa)
                                    ? Text(
                                        "Deskripsi Kendala:",
                                        style: AllMaterial.montSerrat(
                                          fontSize: 13,
                                        ),
                                      )
                                    : Text(
                                        "Rujukan Kompetensi Dasar:",
                                        style: AllMaterial.montSerrat(
                                          fontSize: 13,
                                        ),
                                      ),
                                subtitle: (isKendalaSiswa)
                                    ? Text(
                                        AllMaterial.hurufPertama(
                                          controller.kendala.value?.data
                                                  ?.deskripsi ??
                                              "",
                                        ),
                                        style: AllMaterial.montSerrat(
                                          fontSize: 16,
                                          fontWeight: AllMaterial.fontBold,
                                        ),
                                      )
                                    : Text(
                                        AllMaterial.hurufPertama(
                                          controller.laporan.value?.data
                                                  ?.rujukanKompetensiDasar ??
                                              "",
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
                                  "Instansi terkait:",
                                  style: AllMaterial.montSerrat(
                                    fontSize: 13,
                                  ),
                                ),
                                subtitle: Text(
                                  (isKendalaSiswa)
                                      ? AllMaterial.setiapNamaHurufPertama(
                                          controller
                                                  .kendala
                                                  .value
                                                  ?.data
                                                  ?.siswa
                                                  ?.dudi
                                                  ?.namaInstansiPerusahaan ??
                                              "")
                                      : AllMaterial.setiapNamaHurufPertama(
                                          controller.laporan.value?.data?.dudi
                                                  ?.namaInstansiPerusahaan ??
                                              "",
                                        ),
                                  style: AllMaterial.montSerrat(
                                    fontSize: 16,
                                    fontWeight: AllMaterial.fontBold,
                                  ),
                                ),
                              ),
                              (isKendalaSiswa)
                                  ? (controller.kendala.value?.data
                                                  ?.fileLaporan ==
                                              null ||
                                          controller.kendala.value?.data
                                                  ?.fileLaporan ==
                                              "")
                                      ? const SizedBox.shrink()
                                      : ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 15,
                                          ),
                                          title: Text(
                                            "Bukti Dokumentasi:",
                                            style: AllMaterial.montSerrat(
                                              fontSize: 13,
                                            ),
                                          ),
                                          subtitle: GestureDetector(
                                            onTap: () {
                                              if (fileKendala != "" &&
                                                  (fileKendala
                                                          .endsWith('.pdf') ||
                                                      fileKendala
                                                          .endsWith('.docx'))) {
                                                print("Masuk ke if dokumen");
                                                openFile(fileKendala.replaceAll(
                                                    "localhost",
                                                    "103.56.148.178"));
                                              } else {
                                                print("Masuk ke else gambar");
                                                showDialog(
                                                  context: context,
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.9),
                                                  builder: (context) =>
                                                      StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
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
                                                                fileKendala.replaceAll(
                                                                    "localhost",
                                                                    "103.56.148.178"),
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
                                                              enableRotation:
                                                                  true,
                                                              loadingBuilder:
                                                                  (context,
                                                                          event) =>
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
                                                                icon:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .white,
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
                                              }
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black87
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      fileKendala.replaceAll(
                                                          "localhost",
                                                          "103.56.148.178"),
                                                      fit: BoxFit.cover,
                                                      width: 35,
                                                      height: 35,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return const Icon(
                                                            Icons.description);
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Expanded(
                                                    child: Text(
                                                      fileKendala
                                                          .split('/')
                                                          .last
                                                          .toString()
                                                          .split(' ')
                                                          .join('-'),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: AllMaterial
                                                          .montSerrat(
                                                        color: Colors.black87
                                                            .withOpacity(0.7),
                                                        fontWeight: AllMaterial
                                                            .fontMedium,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                  : (controller.laporan.value?.data
                                              ?.dokumentasi ==
                                          null)
                                      ? const SizedBox.shrink()
                                      : ListTile(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 0,
                                            horizontal: 15,
                                          ),
                                          title: Text(
                                            "Bukti Dokumentasi:",
                                            style: AllMaterial.montSerrat(
                                              fontSize: 13,
                                            ),
                                          ),
                                          subtitle: GestureDetector(
                                            onTap: () {
                                              if (fileLaporan != "" &&
                                                  (fileLaporan
                                                          .endsWith('.pdf') ||
                                                      fileLaporan
                                                          .endsWith('.docx'))) {
                                                print("Masuk ke if dokumen");
                                                openFile(fileLaporan.replaceAll(
                                                    "localhost",
                                                    "103.56.148.178"));
                                              } else {
                                                print("Masuk ke else gambar");
                                                showDialog(
                                                  context: context,
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.9),
                                                  builder: (context) =>
                                                      StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
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
                                                                fileLaporan.replaceAll(
                                                                    "localhost",
                                                                    "103.56.148.178"),
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
                                                              enableRotation:
                                                                  true,
                                                              loadingBuilder:
                                                                  (context,
                                                                          event) =>
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
                                                                icon:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: Colors
                                                                      .white,
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
                                              }
                                            },
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.only(top: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black87
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      fileLaporan.replaceAll(
                                                          "localhost",
                                                          "103.56.148.178"),
                                                      fit: BoxFit.cover,
                                                      width: 35,
                                                      height: 35,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return const Icon(
                                                            Icons.description);
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Expanded(
                                                    child: Text(
                                                      fileLaporan
                                                          .split('/')
                                                          .last
                                                          .toString()
                                                          .split(' ')
                                                          .join('-'),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: AllMaterial
                                                          .montSerrat(
                                                        color: Colors.black87
                                                            .withOpacity(0.7),
                                                        fontWeight: AllMaterial
                                                            .fontMedium,
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
        },
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: Get.width,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AllMaterial.colorBlue,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Kembali Ke Beranda',
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontSemiBold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
