import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/detil_notifikasi_siswa/views/detil_notifikasi_siswa_view.dart';

import '../controllers/notifikasi_guru_controller.dart';

class NotifikasiGuruView extends GetView<NotifikasiGuruController> {
  const NotifikasiGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NotifikasiGuruController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Notifikasi Saya',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.isFalse) {
            return const Center(
              child: CircularProgressIndicator(
                color: AllMaterial.colorBlue,
              ),
            );
          }
          return ListView.builder(
            // itemCount: controller.notifikasiList.length,
            itemCount: 2,
            itemBuilder: (context, index) {
              // final notifikasi = controller.notifikasiList[index];
              return Column(
                children: [
                  Material(
                    color: const Color(0xffFAFAFA),
                    child: InkWell(
                      onTap: () {
                        // ke detil notifikasi
                        Get.to(() => const DetilNotifikasiSiswaView());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                // if (!notifikasi.isRead)
                                //   const CircleAvatar(
                                //     radius: 5,
                                //     backgroundColor: AllMaterial.colorRed,
                                //   ),
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: AllMaterial.colorRed,
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset("assets/icons/check.svg"),
                              ],
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    minVerticalPadding: 0,
                                    title: Text(
                                      // notifikasi.title,
                                      "Kabar Baik Untukmu!",
                                      style: AllMaterial.montSerrat(
                                        fontWeight: AllMaterial.fontSemiBold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      // notifikasi.message,
                                      "Ajuan PKL-mu yang telah Anda ajukan telah diterima di PT. Telkom Indonesia...",
                                      maxLines: 2,
                                      style: AllMaterial.montSerrat(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              // notifikasi.timestamp,
                              "20:10",
                              style: AllMaterial.montSerrat(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: Get.width,
                    color: const Color(0xffD9D9D9),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
