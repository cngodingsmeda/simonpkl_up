// ignore_for_file: deprecated_member_use

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/ajuan_pkl_siswa_dudi/views/ajuan_pkl_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/menunggu_verifikasi_pkl_siswa_dudi/views/menunggu_verifikasi_pkl_siswa_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/notifikasi_dudi/views/notifikasi_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/controllers/profile_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/skema_pkl_dudi/views/skema_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/homepage_dudi_controller.dart';

class HomepageDudiView extends GetView<HomepageDudiController> {
  const HomepageDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageDudiController());
    final profCont = Get.put(ProfileDudiController());
    controller.getNotifUnreadDudi();
    controller.getCountSiswaDudi();
    controller.getAllPengajuanPKL();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang, Dudi",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "Username : ${profCont.profil.value?.username ?? ""}",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontRegular,
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => (controller.readCount.value == 0)
                          ? IconButton(
                              tooltip: "Notifikasi",
                              style: const ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AllMaterial.colorBlue,
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => const NotifikasiDudiView());
                              },
                              icon: const Icon(
                                Icons.notifications,
                                color: AllMaterial.colorWhite,
                              ),
                            )
                          : badges.Badge(
                              position: badges.BadgePosition.topEnd(),
                              badgeContent: Text(
                                controller.readCount.value.toString(),
                                style: AllMaterial.montSerrat(
                                  color: AllMaterial.colorWhite,
                                ),
                              ),
                              child: IconButton(
                                tooltip: "Notifikasi",
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    AllMaterial.colorBlue,
                                  ),
                                ),
                                onPressed: () {
                                  Get.to(() => const NotifikasiDudiView());
                                },
                                icon: const Icon(
                                  Icons.notifications,
                                  color: AllMaterial.colorWhite,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.all(25),
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AllMaterial.colorBlue,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/logo/opacity.png"),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tentang PKL",
                        style: AllMaterial.montSerrat(
                          color: AllMaterial.colorWhite,
                          fontWeight: AllMaterial.fontSemiBold,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_2_outlined,
                                  color: AllMaterial.colorWhite,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      "${controller.jumlahSiswa.value} Siswa Terikat",
                                      style: AllMaterial.montSerrat(
                                        color: AllMaterial.colorWhite,
                                        fontWeight: AllMaterial.fontMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.cases_outlined,
                                  color: AllMaterial.colorWhite,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "3 Guru Pembimbing Terikat",
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorWhite,
                                      fontWeight: AllMaterial.fontMedium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.running_with_errors_sharp,
                                  color: AllMaterial.colorWhite,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      "${controller.jumlahPengajuanProses.value} Ajuan Menunggu Verifikasi",
                                      style: AllMaterial.montSerrat(
                                        color: AllMaterial.colorWhite,
                                        fontWeight: AllMaterial.fontMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: Get.width,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.laptop,
                            color: AllMaterial.colorBlue,
                          ),
                          onPressed: () {
                            Get.to(
                              () => const SkemaPklDudiView(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(Get.width),
                            shadowColor: Colors.transparent,
                            backgroundColor: AllMaterial.colorWhite,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          label: Text(
                            "Skema PKL",
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorBlue,
                              fontWeight: AllMaterial.fontMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Get.to(() => const AjuanPklSiswaDudiView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ajuan PKL",
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorBlack,
                              fontWeight: AllMaterial.fontSemiBold,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: AllMaterial.colorBlack,
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      if (controller.pengajuanPKL.value == null ||
                          controller.pengajuanPKL.value!.data!.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 25),
                            Center(
                              child: Text(
                                "Belum ada siswa bimbingan",
                                style: AllMaterial.montSerrat(),
                              ),
                            ),
                          ],
                        );
                      }
                      var ajuanList = controller.pengajuanPKL.value!.data!
                          .where(
                            (element) => element.status == "proses",
                          )
                          .take(3)
                          .toList();
                      if (controller.jumlahPengajuanProses.value > 0) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ajuanList.length,
                          itemBuilder: (context, index) {
                            var ajuan = ajuanList[index];
                            return CardWidget(
                              onTap: () => Get.to(
                                () =>
                                    const MenungguVerifikasiPklSiswaDudiView(),
                                arguments: {"id": ajuanList[index].id},
                              ),
                              tanggal: AllMaterial.setiapNamaHurufPertama(
                                  ajuan.siswa?.nama ?? ""),
                              icon: CircleAvatar(
                                backgroundColor: const Color(0xffF8F8F8),
                                child: SvgPicture.asset(
                                  "assets/icons/tanda-seru.svg",
                                ),
                              ),
                              keterangan: ajuan.siswa?.kelas?.nama ?? "",
                            );
                          },
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 25),
                            Center(
                              child: Text(
                                "Belum ada ajuan pkl",
                                style: AllMaterial.montSerrat(),
                              ),
                            ),
                          ],
                        );
                      }
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
