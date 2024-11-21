import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:photo_view/photo_view.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/model/model_siswa/detil_absen_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';

import '../controllers/detil_absen_siswa_guru_controller.dart';

class DetilAbsenSiswaGuruView extends GetView<DetilAbsenSiswaGuruController> {
  const DetilAbsenSiswaGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(DetilAbsenSiswaGuruController());
    var arg = Get.arguments;
    PhotoViewController photoViewController = PhotoViewController();
    void openFile(String file) async {
      await OpenFile.open(file);
    }

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
            print("masuk ke else detil histori absen");
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
                                    ? ""
                                    : AllMaterial.ubahHari(
                                        absensi.tanggal!.toIso8601String()),
                                style: AllMaterial.montSerrat(
                                  color: AllMaterial.colorWhite,
                                  fontSize: 20,
                                  fontWeight: AllMaterial.fontSemiBold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Oleh : ${AllMaterial.formatNamaPanjang((arg["nama"] == null ? "" : arg["nama"].toString().toUpperCase()))}",
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
                                    "Jenis Absen:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Absen ${arg["jenis"].toString().contains("pulang") ? "Pulang" : "Masuk"}",
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
                                    "Status Absen:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    controller
                                        .getTextRadiusStatus(arg["jenis"]),
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
                                    controller.getTextStatus(arg["jenis"]),
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                buildAbsenTile(
                                    arg["jenis"], absensi, controller),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 15,
                                  ),
                                  title: Text(
                                    "Tempat PKL Siswa:",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 13,
                                    ),
                                  ),
                                  subtitle: Text(
                                    absensi?.siswa?.dudi
                                            ?.namaInstansiPerusahaan ??
                                        "",
                                    style: AllMaterial.montSerrat(
                                      fontSize: 16,
                                      fontWeight: AllMaterial.fontBold,
                                    ),
                                  ),
                                ),
                                if (absensi!.fotoAbsenMasuk != null &&
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
                                          final bool isMasuk = arg["jenis"]
                                                  ?.toString()
                                                  .contains("masuk") ??
                                              false;
                                          final String? fotoAbsen = isMasuk
                                              ? absensi.fotoAbsenMasuk
                                              : absensi.fotoAbsenPulang;
                                          if (fotoAbsen != null &&
                                              (fotoAbsen.endsWith('.pdf') ||
                                                  fotoAbsen
                                                      .endsWith('.docx'))) {
                                            print("Masuk ke if dokumen");
                                            openFile(fotoAbsen.replaceAll(
                                                "localhost", "10.0.2.2"));
                                          } else {
                                            print("Masuk ke else gambar");
                                            showDialog(context: context,
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
                                                      Icons.description);
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

Widget buildAbsenTile(String jenis, DetilHistoriAbsenModel? absensi,
    DetilAbsenSiswaGuruController controller) {
  String? keterangan = jenis.contains("masuk")
      ? absensi?.keteranganAbsenMasuk?.note
      : absensi?.keteranganAbsenPulang?.note;

  String status = controller.getTextStatus(jenis);
  if (status == "Tepat Waktu") {
    return const SizedBox.shrink();
  }

  if (keterangan == "" || keterangan == null) {
    return const SizedBox.shrink();
  }

  return ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
    title: Text(
      "Alasan $status:",
      style: AllMaterial.montSerrat(fontSize: 13),
    ),
    subtitle: Text(
      AllMaterial.hurufPertama(keterangan),
      style: AllMaterial.montSerrat(
        fontSize: 16,
        fontWeight: AllMaterial.fontBold,
      ),
    ),
  );
}
