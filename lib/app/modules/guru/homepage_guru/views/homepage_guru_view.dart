import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/notifikasi_guru/views/notifikasi_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/views/detil_histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/views/histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/widgets/cards_widget.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/views/pilihan_absen_siswa_view.dart';

import '../controllers/homepage_guru_controller.dart';

class HomepageGuruView extends GetView<HomepageGuruController> {
  const HomepageGuruView({super.key});
  @override
  Widget build(BuildContext context) {
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
                          "NIP : 21414125125",
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontRegular,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      tooltip: "Notifikasi",
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AllMaterial.colorBlue),
                      ),
                      onPressed: () {
                        Get.to(() => const NotifikasiGuruView());
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: AllMaterial.colorWhite,
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
                                    "3 Siswa Bimbingan",
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
                                    "2 Dudi Terkait",
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
                              () => const PilihanAbsenSiswaView(),
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
                            "Monitoring Siswa",
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
                        Get.to(() => const HistoriAbsenSiswaView());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Histori Absen",
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
                    Column(
                      children: [
                        CardWidget(
                          onTap: () =>
                              Get.to(() => const DetilHistoriAbsenSiswaView()),
                          tanggal: "Habil Arlian Asrori",
                          icon: CircleAvatar(
                            backgroundColor: const Color(0xffF8F8F8),
                            child: SvgPicture.asset(
                              "assets/icons/person.svg",
                            ),
                          ),
                          keterangan: "XI RPL 1",
                        ),
                        CardWidget(
                          onTap: () =>
                              Get.to(() => const DetilHistoriAbsenSiswaView()),
                          tanggal: "Gheral Deva Bagus Archana",
                          icon: CircleAvatar(
                            backgroundColor: const Color(0xffF8F8F8),
                            child: SvgPicture.asset(
                              "assets/icons/person.svg",
                            ),
                          ),
                          keterangan: "XI RPL 2",
                        ),
                        CardWidget(
                          onTap: () =>
                              Get.to(() => const DetilHistoriAbsenSiswaView()),
                          tanggal: "Fauzan Azka Al-Haqi",
                          icon: CircleAvatar(
                            backgroundColor: const Color(0xffF8F8F8),
                            child: SvgPicture.asset(
                              "assets/icons/person.svg",
                            ),
                          ),
                          keterangan: "XI RPL 3",
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
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
