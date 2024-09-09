import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/notifikasi_siswa/views/notifikasi_siswa_view.dart';

import '../controllers/homepage_siswa_controller.dart';

class HomepageSiswaView extends GetView<HomepageSiswaController> {
  const HomepageSiswaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Padding(
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
                        "Selamat Datang, Siswa",
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontBold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "NISN : 21414125125",
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
                      Get.to(() => const NotifikasiSiswaView());
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: AllMaterial.colorWhite,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
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
                    child:
                        // BELUM PKL
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       "Belum ada instansi yang dipilih",
                        //       style: AllMaterial.montSerrat(
                        //         fontWeight: AllMaterial.fontSemiBold,
                        //         color: AllMaterial.colorWhite,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 10),
                        //     ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: AllMaterial.colorWhite,
                        //         fixedSize: const Size.fromWidth(85),
                        //         elevation: 0,
                        //         foregroundColor: AllMaterial.colorBlue,
                        //         shadowColor: Colors.transparent,
                        //       ),
                        //       onPressed: () {
                        //         Get.to(()=> const PilihDudiSiswaView());
                        //       },
                        //       child: Text(
                        //         "Pilih",
                        //         style: AllMaterial.montSerrat(
                        //           fontWeight: AllMaterial.fontMedium,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        //  PENDING PKL
                        //   Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       "Ajuan Saya",
                        //       style: AllMaterial.montSerrat(
                        //         color: AllMaterial.colorWhite,
                        //         fontWeight: AllMaterial.fontSemiBold,
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.symmetric(
                        //           horizontal: 10, vertical: 10),
                        //       child: Column(
                        //         children: [
                        //           Row(
                        //             children: [
                        //               const Icon(
                        //                 Icons.cases_outlined,
                        //                 color: AllMaterial.colorWhite,
                        //               ),
                        //               const SizedBox(width: 10),
                        //               Expanded(
                        //                 child: Text(
                        //                   "CV. Global Vintage Numeration 313",
                        //                   style: AllMaterial.montSerrat(
                        //                     color: AllMaterial.colorWhite,
                        //                     fontWeight: AllMaterial.fontMedium,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           const SizedBox(height: 10),
                        //           Row(
                        //             children: [
                        //               const Icon(
                        //                 Icons.phone_outlined,
                        //                 color: AllMaterial.colorWhite,
                        //               ),
                        //               const SizedBox(width: 10),
                        //               Expanded(
                        //                 child: Text(
                        //                   "+62 867654321",
                        //                   style: AllMaterial.montSerrat(
                        //                     color: AllMaterial.colorWhite,
                        //                     fontWeight: AllMaterial.fontMedium,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           const SizedBox(height: 10),
                        //           Row(
                        //             children: [
                        //               const Icon(
                        //                 Icons.pin_drop_outlined,
                        //                 color: AllMaterial.colorWhite,
                        //               ),
                        //               const SizedBox(width: 10),
                        //               Expanded(
                        //                 child: Text(
                        //                   "Jl. Lorem ipsum, Dolor sit, No. 313",
                        //                   style: AllMaterial.montSerrat(
                        //                     color: AllMaterial.colorWhite,
                        //                     fontWeight: AllMaterial.fontMedium,
                        //                   ),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     const SizedBox(height: 5),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       children: [
                        //         ElevatedButton(
                        //           onPressed: () {},
                        //           style: ElevatedButton.styleFrom(
                        //             shadowColor: Colors.transparent,
                        //             backgroundColor: AllMaterial.colorBlue,
                        //             elevation: 0,
                        //             shape: const RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.all(
                        //                 Radius.circular(16),
                        //               ),
                        //               side: BorderSide(
                        //                 color: AllMaterial.colorWhite,
                        //               ),
                        //             ),
                        //           ),
                        //           child: Text(
                        //             "Batalkan",
                        //             style: AllMaterial.montSerrat(
                        //               color: AllMaterial.colorWhite,
                        //               fontWeight: AllMaterial.fontMedium,
                        //             ),
                        //           ),
                        //         ),
                        //         ElevatedButton(
                        //           onPressed: () {},
                        //           style: ElevatedButton.styleFrom(
                        //             shadowColor: Colors.transparent,
                        //             backgroundColor: AllMaterial.colorWhite,
                        //             elevation: 0,
                        //             shape: const RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.all(
                        //                 Radius.circular(16),
                        //               ),
                        //             ),
                        //           ),
                        //           child: Text(
                        //             "Cek Status",
                        //             style: AllMaterial.montSerrat(
                        //               color: AllMaterial.colorBlue,
                        //               fontWeight: AllMaterial.fontMedium,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        // SUDAH PKL
                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tempat PKL Saya",
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
                                    Icons.cases_outlined,
                                    color: AllMaterial.colorWhite,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "CV. Global Vintage Numeration 313",
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
                                    Icons.phone_outlined,
                                    color: AllMaterial.colorWhite,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "+62 867654321",
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
                                    Icons.pin_drop_outlined,
                                    color: AllMaterial.colorWhite,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      "Jl. Lorem ipsum, Dolor sit, No. 313",
                                      style: AllMaterial.montSerrat(
                                        color: AllMaterial.colorWhite,
                                        fontWeight: AllMaterial.fontMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 210,
                    child: SizedBox(
                      width: 260,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // absen
                        },
                        icon: const Icon(
                          Icons.fingerprint,
                          color: AllMaterial.colorBlue,
                        ),
                        label: Text(
                          "Absen Harian",
                          style: AllMaterial.montSerrat(
                            color: AllMaterial.colorBlue,
                            fontWeight: AllMaterial.fontMedium,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AllMaterial.colorWhite,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // JIKA SUDAH PKL
              const SizedBox(height: 50),
              Row(
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CardWidget(
                        tanggal: "Sabtu, 24 Agustus 2024",
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: "Sakit",
                        tekan: () {},
                      ),
                      CardWidget(
                        tanggal: "Sabtu, 24 Agustus 2024",
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: "Sakit",
                        tekan: () {},
                      ),
                      CardWidget(
                        tanggal: "Sabtu, 24 Agustus 2024",
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        keterangan: "Sakit",
                        tekan: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.tanggal,
    required this.icon,
    required this.keterangan,
    this.tekan,
  });

  String keterangan;
  String tanggal;
  Icon icon;
  void Function()? tekan;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        surfaceTintColor: AllMaterial.colorWhite,
        color: AllMaterial.colorWhite,
        borderOnForeground: true,
        shadowColor: AllMaterial.colorGreySec,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          onTap: tekan,
          leading: icon,
          title: Text(
            tanggal,
            style: AllMaterial.montSerrat(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            keterangan,
            style: AllMaterial.montSerrat(),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
