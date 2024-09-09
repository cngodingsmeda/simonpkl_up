import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/notifikasi_siswa_controller.dart';

class NotifikasiSiswaView extends GetView<NotifikasiSiswaController> {
  const NotifikasiSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Material(
                  color: const Color(0xffFAFAFA),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 20,
                      ),
                      margin: EdgeInsets.zero,
                      child: Row(children: [
                        Row(
                          children: [
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
                                  "Kabar Baik!",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontSemiBold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Ajuan PKL-mu yang telah Anda ajukan telah diterima di PT. Telkom Indonesia",
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
                          "19:55",
                          style: AllMaterial.montSerrat(),
                        ),
                      ]),
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
        ),
      ),
    );
  }
}
