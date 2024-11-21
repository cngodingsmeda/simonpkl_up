import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:photo_view/photo_view.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/controllers/profile_dudi_controller.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';

import '../controllers/detil_laporan_pkl_dudi_controller.dart';

class DetilLaporanPklDudiView extends GetView<DetilLaporanPklDudiController> {
  const DetilLaporanPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetilLaporanPklDudiController());
    final profController = Get.put(ProfileDudiController());
    void openFile(String file) async {
      await OpenFile.open(file);
    }

    bool isKendala = LaporanPklDudiController.isKendala.value;
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SingleChildScrollView(
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
                    SvgPicture.asset("assets/icons/laporan.svg"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: Get.width,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Laporan ${isKendala ? "Kendala" : "Harian"}",
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
                      "Oleh : ${AllMaterial.setiapNamaHurufPertama(profController.profil.value?.nama ?? 'Tidak diketahui')}",
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
                              "Tanggal Laporan Dibuat:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: (isKendala == true)
                                ? Text(
                                    controller.kendala.value?.data?.tanggal ==
                                            null
                                        ? ""
                                        : AllMaterial.ubahHari(
                                            controller.kendala.value?.data
                                                    ?.tanggal
                                                    ?.toIso8601String() ??
                                                "2024-10-26",
                                          ),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  )
                                : Text(
                                    AllMaterial.hurufPertama(
                                      controller.laporan.value?.data?.tanggal ==
                                              null
                                          ? ""
                                          : AllMaterial.ubahHari(
                                              controller.laporan.value?.data
                                                      ?.tanggal
                                                      ?.toIso8601String() ??
                                                  "2024-10-26",
                                            ),
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
                            title: (isKendala == true)
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
                            subtitle: (isKendala == true)
                                ? Text(
                                    AllMaterial.hurufPertama(
                                      controller.kendala.value?.data?.kendala ??
                                          "Tidak ada data",
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
                                          "Tidak ada data",
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
                            title: (LaporanPklDudiController.isKendala.isTrue)
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
                            subtitle:
                                (LaporanPklDudiController.isKendala.isTrue)
                                    ? Text(
                                        AllMaterial.hurufPertama(
                                          controller.kendala.value?.data
                                                  ?.deskripsi ??
                                              "Tidak ada data",
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
                                              "Tidak ada data",
                                        ),
                                        style: AllMaterial.montSerrat(
                                          fontSize: 16,
                                          fontWeight: AllMaterial.fontBold,
                                        ),
                                      ),
                          ),
                          isKendala
                              ? ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Siswa Terkait:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    controller.kendala.value?.data?.siswa
                                                ?.nama ==
                                            null
                                        ? ""
                                        : AllMaterial.setiapNamaHurufPertama(
                                            controller.kendala.value?.data
                                                    ?.siswa?.nama ??
                                                "",
                                          ),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ))
                              : const SizedBox.shrink(),
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
                              profController.profil.value?.dudi
                                      ?.namaInstansiPerusahaan
                                      ?.toUpperCase() ??
                                  "Tidak diketahui",
                              style: AllMaterial.montSerrat(
                                fontSize: 16,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                          ),
                          (LaporanPklDudiController.isKendala.isTrue)
                              ? (controller.kendala.value!.data?.fileLaporan ==
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
                                          PhotoViewController
                                              photoViewController =
                                              PhotoViewController();
                                          var fotoAbsen = controller
                                              .kendala.value!.data?.fileLaporan
                                              .toString();
                                          if (fotoAbsen != null &&
                                              (fotoAbsen.endsWith('.pdf') ||
                                                  fotoAbsen
                                                      .endsWith('.docx'))) {
                                            print("Masuk ke if dokumen");
                                            openFile(fotoAbsen.replaceAll(
                                                "localhost", "10.0.2.2"));
                                          } else {
                                            print("Masuk ke else gambar");
                                            showDialog(
                                                context: context,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.9),
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
                                                            fotoAbsen?.replaceAll(
                                                                    "localhost",
                                                                    "10.0.2.2") ??
                                                                "",
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
                                                            icon: const Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
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
                                          margin: const EdgeInsets.only(top: 5),
                                          padding: const EdgeInsets.symmetric(
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
                                          child: controller.kendala.value!.data!
                                                      .fileLaporan!
                                                      .toString()
                                                      .endsWith('.pdf') ||
                                                  controller.kendala.value!
                                                      .data!.fileLaporan!
                                                      .toString()
                                                      .endsWith('.docx')
                                              ? Row(
                                                  children: [
                                                    Icon(
                                                      Icons.description,
                                                      color: Colors.black87
                                                          .withOpacity(0.7),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                        controller
                                                                    .kendala
                                                                    .value!
                                                                    .data
                                                                    ?.fileLaporan
                                                                    .toString() ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                    .kendala
                                                                    .value!
                                                                    .data
                                                                    ?.fileLaporan
                                                                    .toString()
                                                                    .split('/')
                                                                    .last
                                                                    .toString()
                                                                    .split(' ')
                                                                    .join(
                                                                        '-') ??
                                                                "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AllMaterial
                                                            .montSerrat(
                                                          color: Colors.black87
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              AllMaterial
                                                                  .fontMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image.network(
                                                        controller
                                                            .kendala
                                                            .value!
                                                            .data!
                                                            .fileLaporan!
                                                            .toString()
                                                            .replaceAll(
                                                                "localhost",
                                                                "10.0.2.2"),
                                                        fit: BoxFit.cover,
                                                        width: 35,
                                                        height: 35,
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return const Icon(
                                                              Icons
                                                                  .description);
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                        controller
                                                            .kendala
                                                            .value!
                                                            .data!
                                                            .fileLaporan!
                                                            .toString()
                                                            .split('/')
                                                            .last
                                                            .toString()
                                                            .split(' ')
                                                            .join('-'),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AllMaterial
                                                            .montSerrat(
                                                          color: Colors.black87
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              AllMaterial
                                                                  .fontMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                      ),
                                    )
                              : (controller.laporan.value!.data?.fileLaporan ==
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
                                          PhotoViewController
                                              photoViewController =
                                              PhotoViewController();
                                          var fotoAbsen = controller
                                              .laporan.value!.data?.fileLaporan;
                                          if (fotoAbsen != null &&
                                              (fotoAbsen.endsWith('.pdf') ||
                                                  fotoAbsen
                                                      .endsWith('.docx'))) {
                                            print("Masuk ke if dokumen");
                                            openFile(fotoAbsen.replaceAll(
                                                "localhost", "10.0.2.2"));
                                          } else {
                                            print("Masuk ke else gambar");
                                            showDialog(  context: context,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.9),
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
                                                            fotoAbsen?.replaceAll(
                                                                    "localhost",
                                                                    "10.0.2.2") ??
                                                                "",
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
                                                            icon: const Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
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
                                          margin: const EdgeInsets.only(top: 5),
                                          padding: const EdgeInsets.symmetric(
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
                                          child: controller.laporan.value!.data!
                                                      .fileLaporan!
                                                      .endsWith('.pdf') ||
                                                  controller.laporan.value!
                                                      .data!.fileLaporan!
                                                      .endsWith('.docx')
                                              ? Row(
                                                  children: [
                                                    Icon(
                                                      Icons.description,
                                                      color: Colors.black87
                                                          .withOpacity(0.7),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                        controller
                                                                    .laporan
                                                                    .value!
                                                                    .data
                                                                    ?.fileLaporan ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                    .laporan
                                                                    .value!
                                                                    .data
                                                                    ?.fileLaporan!
                                                                    .split('/')
                                                                    .last
                                                                    .toString()
                                                                    .split(' ')
                                                                    .join(
                                                                        '-') ??
                                                                "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AllMaterial
                                                            .montSerrat(
                                                          color: Colors.black87
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              AllMaterial
                                                                  .fontMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Image.network(
                                                        controller
                                                            .laporan
                                                            .value!
                                                            .data!
                                                            .fileLaporan!
                                                            .replaceAll(
                                                                "localhost",
                                                                "10.0.2.2"),
                                                        fit: BoxFit.cover,
                                                        width: 35,
                                                        height: 35,
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return const Icon(
                                                              Icons
                                                                  .description);
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Expanded(
                                                      child: Text(
                                                        controller
                                                            .laporan
                                                            .value!
                                                            .data!
                                                            .fileLaporan!
                                                            .split('/')
                                                            .last
                                                            .toString()
                                                            .split(' ')
                                                            .join('-'),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: AllMaterial
                                                            .montSerrat(
                                                          color: Colors.black87
                                                              .withOpacity(0.7),
                                                          fontWeight:
                                                              AllMaterial
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
      ),
      bottomNavigationBar: isKendala
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.bukaWhatsApp(controller
                                .kendala.value?.data!.siswa?.noTelepon
                                ?.replaceAll("08", "62") ??
                            "");
                      },
                      icon: Icon(MdiIcons.whatsapp,
                          color: AllMaterial.colorWhite),
                      label: Text(
                        'Hubungi Siswa Ini',
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontSemiBold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllMaterial.colorBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: Get.width,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Get.back();
                      },
                      label: Text(
                        'Kembali',
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontSemiBold,
                          color: AllMaterial.colorBlue,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AllMaterial.colorBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(
                          color: AllMaterial.colorBlue,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Padding(
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
