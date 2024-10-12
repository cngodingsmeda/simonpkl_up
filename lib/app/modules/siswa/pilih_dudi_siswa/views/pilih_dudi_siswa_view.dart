// lib/app/modules/siswa/pilih_dudi_siswa/views/pilih_dudi_siswa_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/model/model_siswa/pilih_dudi_model.dart';

import '../controllers/pilih_dudi_siswa_controller.dart';

class PilihDudiSiswaView extends GetView<PilihDudiSiswaController> {
  const PilihDudiSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PilihDudiSiswaController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Instansi',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            controller.intPage.value = 0;
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
      ),
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: AllMaterial.colorBlue,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Harap Tunggu Sebentar...",
                            style: AllMaterial.montSerrat(
                              fontSize: 18,
                              fontWeight: AllMaterial.fontMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Scrollbar(
                    interactive: true,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.dudi.value!.data.length,
                      itemBuilder: (context, index) {
                        var dudi = controller.dudi.value!.data[index];
                        return ExpansionTile(
                          backgroundColor: AllMaterial.colorWhite,
                          initiallyExpanded: false,
                          tilePadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    dudi.namaInstansiPerusahaan,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: AllMaterial.montSerrat(
                                      fontSize: 15,
                                      color: AllMaterial.colorBlack,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Siswa PKL: ${dudi.jumlahSiswaPria + dudi.jumlahSiswaWanita}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            ListTile(
                              leading: Text(
                                "Tahun :",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              title: Text(
                                dudi.idTahun.toString(),
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "No. Telepon :",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              title: Text(
                                dudi.noTelepon,
                                // "0814177323",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "Bidang :",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              title: Text(
                                AllMaterial.setiapHurufPertama(
                                    dudi.bidangUsaha),
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "Alamat :",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              title: Text(
                                AllMaterial.setiapHurufPertama(
                                  "${dudi.alamat.detailTempat}, ${dudi.alamat.desa}, ${dudi.alamat.kecamatan}, ${dudi.alamat.kabupaten}, ${dudi.alamat.provinsi}",
                                ),
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "Deskripsi :",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              title: Text(
                                AllMaterial.hurufPertama(dudi.deskripsi),
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "Kuota :",
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlack,
                                ),
                              ),
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Laki-Laki",
                                        style: AllMaterial.montSerrat(
                                          fontWeight: AllMaterial.fontSemiBold,
                                          color: AllMaterial.colorBlack,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AllMaterial.colorGreySec,
                                        ),
                                        margin: const EdgeInsets.only(left: 10),
                                        child: RichText(
                                          text: TextSpan(
                                            text: "${dudi.jumlahSiswaPria}",
                                            style: AllMaterial.montSerrat(
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                              color: AllMaterial.colorBlack,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: " / ",
                                                style: AllMaterial.montSerrat(
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
                                                ),
                                              ),
                                              TextSpan(
                                                text: "${dudi.jumlahKuotaPria}",
                                                style: AllMaterial.montSerrat(
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Perempuan",
                                        style: AllMaterial.montSerrat(
                                          fontWeight: AllMaterial.fontSemiBold,
                                          color: AllMaterial.colorBlack,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: AllMaterial.colorGreySec,
                                        ),
                                        margin: const EdgeInsets.only(left: 10),
                                        child: RichText(
                                          text: TextSpan(
                                            text: "${dudi.jumlahSiswaWanita}",
                                            style: AllMaterial.montSerrat(
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                              color: AllMaterial.colorBlack,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: " / ",
                                                style: AllMaterial.montSerrat(
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${dudi.jumlahKuotaWanita}",
                                                style: AllMaterial.montSerrat(
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                  color: AllMaterial.colorBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: dudi.kuotaJurusan.length,
                              itemBuilder: (context, index) {
                                var kuotaJurusan = dudi.kuotaJurusan[index];
                                return ListTileJurusan(
                                  dudi: dudi,
                                  jumlahSiswaPria: kuotaJurusan.jumlahSiswaPria,
                                  jumlahSiswaWanita:
                                      kuotaJurusan.jumlahSiswaWanita,
                                  jurusan: kuotaJurusan.jurusan,
                                  kuotaPria: kuotaJurusan.kuotaPria,
                                  kuotaWanita: kuotaJurusan.kuotaPria,
                                );
                              },
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: (dudi.tersedia != true)
                                  ? null
                                  : () {
                                      Get.defaultDialog(
                                        middleTextStyle:
                                            AllMaterial.montSerrat(),
                                        backgroundColor: AllMaterial.colorWhite,
                                        radius: 10,
                                        buttonColor: AllMaterial.colorBlue,
                                        titleStyle: AllMaterial.montSerrat(
                                          fontWeight: AllMaterial.fontMedium,
                                        ),
                                        title: "Konfirmasi",
                                        middleText:
                                            "Apakah Anda yakin ingin mengajukan PKL di ${AllMaterial.setiapHurufPertama(dudi.namaInstansiPerusahaan)}?",
                                        onConfirm: () {
                                          controller.ajukanPKL(dudi.id);
                                        },
                                        textCancel: "Batalkan",
                                        cancelTextColor: AllMaterial.colorBlue,
                                        textConfirm: "Konfirmasi",
                                      );
                                    },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: (dudi.tersedia != true)
                                      ? AllMaterial.colorGrey.withOpacity(0.2)
                                      : AllMaterial.colorBlue,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: Get.width,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    "Ajukan PKL",
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontSemiBold,
                                      color: AllMaterial.colorWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  );
                }
              }),
            ),
            SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dudi.value?.countPage ?? 1,
                  itemBuilder: (context, index) => Obx(
                    () => GestureDetector(
                      onTap: () {
                        if (controller.dudi.value!.countPage > 1) {
                          controller.changePage(index);
                        }
                      },
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (controller.intPage.value == index)
                              ? AllMaterial.colorBlue
                              : AllMaterial.colorWhite,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "${index + 1}",
                          style: AllMaterial.montSerrat(
                            fontSize: 16,
                            fontWeight: AllMaterial.fontSemiBold,
                            color: (controller.intPage.value == index)
                                ? AllMaterial.colorWhite
                                : AllMaterial.colorBlue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileJurusan extends StatelessWidget {
  ListTileJurusan({
    super.key,
    required this.dudi,
    required this.jumlahSiswaPria,
    required this.jumlahSiswaWanita,
    required this.jurusan,
    required this.kuotaPria,
    required this.kuotaWanita,
  });

  final Datum dudi;
  String jurusan;
  int kuotaPria;
  int jumlahSiswaPria;
  int kuotaWanita;
  int jumlahSiswaWanita;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "Jurusan:",
        style: AllMaterial.montSerrat(
          fontWeight: AllMaterial.fontMedium,
          color: AllMaterial.colorBlack,
        ),
      ),
      title: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AllMaterial.setiapHurufPertama(jurusan),
                overflow: TextOverflow.ellipsis,
                style: AllMaterial.montSerrat(
                  fontWeight: AllMaterial.fontSemiBold,
                  color: AllMaterial.colorBlack,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Laki - Laki :",
                    style: AllMaterial.montSerrat(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AllMaterial.colorGreySec,
                    ),
                    margin: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(
                        text: "$jumlahSiswaPria",
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontSemiBold,
                          color: AllMaterial.colorBlack,
                        ),
                        children: [
                          TextSpan(
                            text: " / ",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorBlack,
                            ),
                          ),
                          TextSpan(
                            text: "$kuotaPria",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Perempuan :",
                    style: AllMaterial.montSerrat(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AllMaterial.colorGreySec,
                    ),
                    margin: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: TextSpan(
                        text: "$jumlahSiswaWanita",
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontSemiBold,
                          color: AllMaterial.colorBlack,
                        ),
                        children: [
                          TextSpan(
                            text: " / ",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorBlack,
                            ),
                          ),
                          TextSpan(
                            text: "$kuotaWanita",
                            style: AllMaterial.montSerrat(
                              fontWeight: AllMaterial.fontSemiBold,
                              color: AllMaterial.colorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
