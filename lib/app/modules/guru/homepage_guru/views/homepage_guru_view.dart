import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/detil_siswa_guru/controllers/detil_siswa_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/home_guru/controllers/home_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/monitoring_guru/views/monitoring_guru_view.dart';
import 'package:simon_pkl/app/modules/guru/notifikasi_guru/controllers/notifikasi_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/notifikasi_guru/views/notifikasi_guru_view.dart';
import 'package:simon_pkl/app/modules/guru/profile_guru/controllers/profile_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/siswa_bimbingan_guru/views/siswa_bimbingan_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';

import '../controllers/homepage_guru_controller.dart';

class HomepageGuruView extends GetView<HomepageGuruController> {
  const HomepageGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    var profController = Get.put(ProfileGuruController());
    var controller = Get.put(HomepageGuruController());
    var homeController = Get.put(HomeGuruController());
    controller.getSiswaBimbingan();
    homeController.indexPage.value = 0;
    controller.getDudiTerkait();
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
                          "Selamat Datang, Guru",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "NIP : ${profController.profil.value?.nip ?? ""}",
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
                                final notif =
                                    Get.put(NotifikasiGuruController());
                                notif.getAllNotif();
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
                                  Get.to(() => const NotifikasiGuruView());
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
                                  child: Text(
                                    "${controller.jumlahSiswa.value} Siswa Bimbingan",
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
                                  Icons.cases_outlined,
                                  color: AllMaterial.colorWhite,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "${controller.jumlahDudi.value} Dudi Terkait",
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
                                  Icons.report_gmailerrorred_rounded,
                                  color: AllMaterial.colorWhite,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    "0 Kendala Siswa",
                                    style: AllMaterial.montSerrat(
                                      color: AllMaterial.colorWhite,
                                      fontWeight: AllMaterial.fontMedium,
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
                              () => const MonitoringGuruView(),
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
                            "Monitoring PKL",
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
                        Get.to(() => const SiswaBimbinganGuruView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Siswa Bimbingan",
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
                      if (controller.siswaBimbingan.value == null ||
                          controller.siswaBimbingan.value!.data!.isEmpty) {
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
                      var siswaList = controller.siswaBimbingan.value!.data!
                          .take(3)
                          .toList();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: siswaList.length,
                        itemBuilder: (context, index) {
                          var siswa = siswaList[index];
                          return CardWidget(
                            onTap: () {
                              var detilSiswa =
                                  Get.put(DetilSiswaGuruController());
                              detilSiswa.getDetilSiswaById(siswa.id ?? 0);
                            },
                            tanggal: AllMaterial.setiapHurufPertama(siswa.nama),
                            icon: CircleAvatar(
                              backgroundColor: const Color(0xffF8F8F8),
                              backgroundImage: (siswa.fotoProfile != null)
                                  ? NetworkImage(
                                      siswa.fotoProfile!
                                          .replaceAll("localhost", "10.0.2.2"),
                                    )
                                  : const AssetImage(
                                          "assets/images/foto-profile.png")
                                      as ImageProvider,
                              child: (siswa.fotoProfile == null)
                                  ? SvgPicture.asset("assets/icons/person.svg")
                                  : null,
                            ),
                            keterangan: siswa.kelas!.nama!,
                          );
                        },
                      );
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
