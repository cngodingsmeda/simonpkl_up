import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/controllers/profile_dudi_controller.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/widgets/clippath_widget.dart';

import '../controllers/menunggu_verifikasi_pkl_siswa_dudi_controller.dart';

class MenungguVerifikasiPklSiswaDudiView
    extends GetView<MenungguVerifikasiPklSiswaDudiController> {
  const MenungguVerifikasiPklSiswaDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MenungguVerifikasiPklSiswaDudiController());
    var dudiC = Get.put(ProfileDudiController());
    var arg = Get.arguments;
    var dataDudi = dudiC.profil.value;
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
                    SvgPicture.asset("assets/icons/menunggu-persetujuan.svg"),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Menunggu Persetujuan",
                          style: AllMaterial.montSerrat(
                            color: AllMaterial.colorWhite,
                            fontSize: 20,
                            fontWeight: AllMaterial.fontSemiBold,
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        "Oleh : ${controller.detilAjuan.value?.data?.siswa?.nama == null ? "" : AllMaterial.setiapNamaHurufPertama(controller.detilAjuan.value?.data?.siswa?.nama ?? "")}",
                        style: AllMaterial.montSerrat(
                          color: AllMaterial.colorWhite,
                          fontSize: 15,
                          fontWeight: AllMaterial.fontRegular,
                        ),
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
                              "Status Info:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              "Menunggu Verifikasi",
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
                              "Tanggal Ajuan Verifikasi",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Obx(
                              () => Text(
                                controller.detilAjuan.value?.data
                                            ?.waktuPengajuan ==
                                        null
                                    ? ""
                                    : AllMaterial.ubahHari(controller.detilAjuan
                                            .value?.data?.waktuPengajuan
                                            ?.toIso8601String() ??
                                        ""),
                                style: AllMaterial.montSerrat(
                                  fontSize: 16,
                                  fontWeight: AllMaterial.fontBold,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            title: Text(
                              "Instansi Dipilih:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              dataDudi?.dudi?.namaInstansiPerusahaan ?? "",
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
                              "No. Telepon Instansi:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              dataDudi?.dudi?.noTelepon ?? "",
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
                              "Alamat Instansi:",
                              style: AllMaterial.montSerrat(
                                fontSize: 13,
                              ),
                            ),
                            subtitle: Text(
                              AllMaterial.formatAlamat(
                                '${dataDudi?.alamat?.detailTempat}, ${dataDudi?.alamat?.desa}, ${dataDudi?.alamat?.kecamatan}, ${dataDudi?.alamat?.kabupaten}, ${dataDudi?.alamat?.provinsi}',
                              ),
                              style: AllMaterial.montSerrat(
                                fontSize: 16,
                                fontWeight: AllMaterial.fontBold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: AllMaterial.colorBlue,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: AllMaterial.colorWhite,
                                    elevation: 0,
                                    side: const BorderSide(
                                      color: AllMaterial.colorBlue,
                                      width: 1,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.close,
                                    color: AllMaterial.colorBlue,
                                  ),
                                  onPressed: () {
                                    AllMaterial.cusDialogValidasi(
                                      title: "Tolak Ajuan",
                                      subtitle:
                                          "Apakah Anda ingin menolak ajuan pkl?",
                                      onConfirm: () {
                                        controller.putAccDccAjuanPKL(
                                            arg["id"], false, context);
                                            Get.back();
                                      },
                                      onCancel: () => Get.back(),
                                    );
                                  },
                                  label: Text(
                                    "Tolak Ajuan",
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorBlue,
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.transparent,
                                    backgroundColor: AllMaterial.colorBlue,
                                    elevation: 0,
                                  ),
                                  icon: const Icon(
                                    Icons.check,
                                    color: AllMaterial.colorWhite,
                                  ),
                                  onPressed: () {
                                    AllMaterial.cusDialogValidasi(
                                      title: "Terima Ajuan",
                                      subtitle:
                                          "Apakah Anda ingin menerima ajuan pkl?",
                                      onConfirm: () =>
                                          controller.putAccDccAjuanPKL(
                                              controller.arg["id"],
                                              true,
                                              context),
                                      onCancel: () => Get.back(),
                                    );
                                  },
                                  label: Text(
                                    "Terima Ajuan",
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorWhite,
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                ),
                              )
                            ],
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
