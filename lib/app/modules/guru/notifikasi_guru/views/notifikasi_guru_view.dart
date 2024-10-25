import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/detil_notifikasi_guru/views/detil_notifikasi_guru_view.dart';

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
      body: Obx(() {
        if (controller.allNotifikasi.value == null ||
            controller.allNotifikasi.value!.data.isEmpty) {
          return Center(
            child: Text(
              "Belum ada notifikasi...",
              style: AllMaterial.montSerrat(),
            ),
          );
        }

        // Akses langsung ke list notifikasi
        var allNotifikasi = controller.allNotifikasi.value!.data;
        return ListView.builder(
          itemCount: allNotifikasi.length,
          itemBuilder: (context, index) {
            var tanggalNotifikasi = allNotifikasi.keys.toList()[index];
            var listNotifikasi = allNotifikasi[tanggalNotifikasi]!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    tanggalNotifikasi,
                    style: AllMaterial.montSerrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listNotifikasi.length,
                  itemBuilder: (context, idx) {
                    final notifikasi = listNotifikasi[idx];
                    return Material(
                      color: notifikasi.reads.isEmpty
                          ? const Color(0xffFAFAFA)
                          : AllMaterial.colorWhite,
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => const DetilNotifikasiGuruView(),
                            arguments: {"id": notifikasi.id},
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
                          child: Row(
                            children: [
                              if (notifikasi.reads.isEmpty)
                                const CircleAvatar(
                                  radius: 5,
                                  backgroundColor: AllMaterial.colorRed,
                                )
                              else
                                const SizedBox(width: 10),
                              const SizedBox(width: 5),
                              if (notifikasi.title
                                  .toLowerCase()
                                  .contains("buruk"))
                                SvgPicture.asset("assets/icons/silang.svg")
                              else if (notifikasi.title
                                  .toLowerCase()
                                  .contains("informasi"))
                                SvgPicture.asset("assets/icons/tanda_seru.svg")
                              else
                                SvgPicture.asset("assets/icons/check.svg"),
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
                                            notifikasi.title),
                                        style: AllMaterial.montSerrat(
                                          fontWeight: AllMaterial.fontSemiBold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        notifikasi.body,
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
                    );
                  },
                ),
                const Divider(color: Color(0xffD9D9D9), thickness: 1),
              ],
            );
          },
        );
      }),
    );
  }
}
