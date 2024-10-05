import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/detil_notifikasi_siswa/views/detil_notifikasi_siswa_view.dart';

import '../controllers/notifikasi_siswa_controller.dart';

class NotifikasiSiswaView extends GetView<NotifikasiSiswaController> {
  const NotifikasiSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(NotifikasiSiswaController());
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
      body: Obx(() {
        if (controller.allNotifikasi.value == null) {
          return const Center(
            child: CircularProgressIndicator(
              color: AllMaterial.colorBlue,
            ),
          );
        }
        var allNotif = controller.allNotifikasi.value!.data;
        return ListView.builder(
          itemCount: allNotif.length,
          itemBuilder: (context, index) {
            final notifikasi = allNotif[index];

            return Column(
              children: [
                Material(
                  color: notifikasi.reads.isEmpty
                      ? const Color(0xffFAFAFA)
                      : AllMaterial.colorWhite,
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => const DetilNotifikasiSiswaView(),
                        arguments: notifikasi.id,
                      );
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
                              (notifikasi.reads.isEmpty)
                                  ? const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: AllMaterial.colorRed,
                                    )
                                  : const SizedBox(width: 10),
                              const SizedBox(width: 5),
                              (notifikasi.body.toLowerCase().contains("buruk"))
                                  ? SvgPicture.asset("assets/icons/silang.svg")
                                  : (notifikasi.body
                                          .toLowerCase()
                                          .contains("informasi"))
                                      ? SvgPicture.asset(
                                          "assets/icons/tanda_seru.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/icons/check.svg",
                                        ),
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
                                    AllMaterial.setiapHurufPertama(
                                      notifikasi.title,
                                    ),
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontSemiBold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    AllMaterial.hurufPertama(notifikasi.body),
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
                            AllMaterial.ubahJam(
                                notifikasi.createdAt.toString()),
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
      }),
    );
  }
}
