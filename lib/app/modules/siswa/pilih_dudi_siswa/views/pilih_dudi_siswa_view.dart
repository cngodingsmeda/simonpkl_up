import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

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
        centerTitle: true,
        surfaceTintColor: AllMaterial.colorWhite,
        backgroundColor: AllMaterial.colorWhite,
        // actions: [
        //   Container(
        //     margin: EdgeInsets.only(
        //       right: 8,
        //     ),
        //     width: 40,
        //     height: 40,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(30),
        //       ),
        //       color: AllMaterial.colorBlue,
        //     ),
        //     child: IconButton(
        //       onPressed: () {},
        //       iconSize: 20,
        //       color: AllMaterial.colorWhite,
        //       icon: Icon(Icons.search),
        //     ),
        //   ),
        //   Container(
        //     margin: EdgeInsets.only(
        //       right: 8,
        //     ),
        //     width: 40,
        //     height: 40,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(30),
        //       ),
        //       color: AllMaterial.colorBlue,
        //     ),
        //     child: IconButton(
        //       onPressed: () {},
        //       iconSize: 20,
        //       color: AllMaterial.colorWhite,
        //       icon: Icon(Icons.filter_alt),
        //     ),
        //   ),
        // ],
      ),
      backgroundColor: AllMaterial.colorWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child:
                  //  Obx(
                  //   () =>
                  FutureBuilder(
                // future: controller.fetchData(),
                future: Future.delayed(
                  const Duration(seconds: 1),
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Scrollbar(
                      interactive: true,
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        // itemCount: controller.dataPrevDudi.length,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            backgroundColor: AllMaterial.colorWhite,
                            initiallyExpanded: false,
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            title:  Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      // "${controller.dataPrevDudi[index]["nama_instansi_perusahaan"]}"
                                      //     .capitalizeEach(),
                                      "CV. Global Vintage Numeration 313",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: AllMaterial.montSerrat(
                                        fontSize: 15,
                                        // fontFamily: AllMaterial.fontFamily,
                                        color: AllMaterial.colorBlack,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                 FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    // (controller.dataPrevDudi[index]
                                    //                 ["total_siswa"] !=
                                    //             null &&
                                    //         controller.dataPrevDudi[index]
                                    //                 ["total_siswa"] !=
                                    //             "")
                                    //     ? "Siswa PKL: ${controller.dataPrevDudi[index]["total_siswa"]}"
                                    //     : "Siswa PKL: 0",
                                    "Siswa PKL: 0",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: AllMaterial.montSerrat(
                                      fontWeight: AllMaterial.fontMedium
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
                                    // fontFamily: AllMaterial.fontFamily,
                                  ),
                                ),
                                title: Text(
                                  "2024",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                      // fontFamily: AllMaterial.fontFamily,
                                      ),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "No. Telepon :",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                    color: AllMaterial.colorBlack,
                                    // fontFamily: AllMaterial.fontFamily,
                                  ),
                                ),
                                title: Text(
                                  // "${controller.dataPrevDudi[index]["no_telepon"]}",
                                  "08159624214",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                      // fontFamily: AllMaterial.fontFamily,
                                      ),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "Bidang :",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                    color: AllMaterial.colorBlack,
                                    // fontFamily: AllMaterial.fontFamily,
                                  ),
                                ),
                                title: Text(
                                  // "${controller.dataPrevDudi[index]["bidang"]}"
                                  //     .capitalizeEach(),
                                  "Gim Online",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                      // fontFamily: AllMaterial.fontFamily,
                                      ),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "Alamat :",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                    color: AllMaterial.colorBlack,
                                    // fontFamily: AllMaterial.fontFamily,
                                  ),
                                ),
                                title: Text(
                                  // "${controller.dataPrevDudi[index]["detail_tempat"]}, ${controller.dataPrevDudi[index]["desa"]}, ${controller.dataPrevDudi[index]["kecamatan"]}, ${controller.dataPrevDudi[index]["kabupaten"]}, ${controller.dataPrevDudi[index]["provinsi"]}"
                                  //     .capitalizeEach(),
                                  "Jl. Gomong",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                      // fontFamily: AllMaterial.fontFamily,
                                      ),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "Deskripsi :",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                    color: AllMaterial.colorBlack,
                                    // fontFamily: AllMaterial.fontFamily,
                                  ),
                                ),
                                title: Text(
                                  // toBeginningOfSentenceCase(
                                  //     "${controller.dataPrevDudi[index]["deksripsi"]}"),
                                  "Tempat PKL Terbaik",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                      // fontFamily: AllMaterial.fontFamily,
                                      ),
                                ),
                              ),
                              ListTile(
                                leading: Text(
                                  "Kuota :",
                                  style: AllMaterial.montSerrat(
                                    fontWeight: AllMaterial.fontMedium,
                                    
                                    color: AllMaterial.colorBlack,
                                    // fontFamily: AllMaterial.fontFamily,
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
                                            // fontFamily:
                                            //     AllMaterial.fontFamily,
                                            fontWeight:
                                                AllMaterial.fontSemiBold,
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
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              // text: (controller.dataPrevDudi[
                                              //                 index][
                                              //             "total_siswa_laki"] !=
                                              //         null)
                                              //     ? "${controller.dataPrevDudi[index]["total_siswa_laki"]}"
                                              //     : "0",
                                              text: "0",
                                              style: AllMaterial.montSerrat(
                                                // fontFamily:
                                                // AllMaterial.fontFamily,
                                                fontWeight:
                                                    AllMaterial.fontSemiBold,
                                                color: AllMaterial.colorBlack,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: " / ",
                                                  style: AllMaterial.montSerrat(
                                                    // fontFamily: AllMaterial
                                                    //     .fontFamily,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                    color:
                                                        AllMaterial.colorBlack,
                                                  ),
                                                ),
                                                TextSpan(
                                                  // text: (controller.dataPrevDudi[
                                                  //                 index][
                                                  //             "kouta_laki"] !=
                                                  //         null)
                                                  //     ? "${controller.dataPrevDudi[index]["kouta_laki"]}"
                                                  //     : "0",
                                                  text: "0",
                                                  style: AllMaterial.montSerrat(
                                                    // fontFamily: AllMaterial
                                                    //     .fontFamily,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                    color:
                                                        AllMaterial.colorBlack,
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
                                            // fontFamily:
                                            // AllMaterial.fontFamily,
                                            fontWeight:
                                                AllMaterial.fontSemiBold,
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
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              // text: (controller.dataPrevDudi[
                                              //                 index][
                                              //             "total_siswa_perempuan"] !=
                                              //         null)
                                              //     ? "${controller.dataPrevDudi[index]["total_siswa_perempuan"]}"
                                              //     : "0",
                                              text: "0",
                                              style: AllMaterial.montSerrat(
                                                // fontFamily:
                                                //     AllMaterial.fontFamily,
                                                fontWeight:
                                                    AllMaterial.fontSemiBold,
                                                color: AllMaterial.colorBlack,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: " / ",
                                                  style: AllMaterial.montSerrat(
                                                    // fontFamily: AllMaterial
                                                    //     .fontFamily,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                    color:
                                                        AllMaterial.colorBlack,
                                                  ),
                                                ),
                                                TextSpan(
                                                  // text: (controller.dataPrevDudi[
                                                  //                 index][
                                                  //             "kouta_perempuan"] !=
                                                  //         null)
                                                  //     ? "${controller.dataPrevDudi[index]["kouta_perempuan"]}"
                                                  //     : "0",
                                                  text: "0",
                                                  style: AllMaterial.montSerrat(
                                                    // fontFamily: AllMaterial
                                                    //     .fontFamily,
                                                    fontWeight: AllMaterial
                                                        .fontSemiBold,
                                                    color:
                                                        AllMaterial.colorBlack,
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
                              const SizedBox(height: 10),
                              // (controller.dataPrevDudi[index]["enabled"]
                              //         .toString()
                              //         .contains("true"))
                              //     ? 
                              GestureDetector(
                                      onTap: () {
                                        Get.defaultDialog(
                                          // middle:AllMaterial.montSerrat: AllMaterial.montSerrat(
                                          //   fontFamily:
                                          //       AllMaterial.fontFamily,
                                          // ),
                                          middleTextStyle: AllMaterial.montSerrat(),
                                          backgroundColor:
                                              AllMaterial.colorWhite,
                                          radius: 10,
                                          buttonColor: AllMaterial.colorBlue,
                                          titleStyle: AllMaterial.montSerrat(
                                              fontWeight:
                                                  AllMaterial.fontMedium),
                                          title: "Konfirmasi",
                                          middleText:
                                              // "Apakah Anda yakin ingin mengajukan PKL di ${controller.dataPrevDudi[index]["nama_instansi_perusahaan"].toString().capitalizeEach()}?",
                                              "Apakah Anda yakin ingin mengajukan PKL?",
                                          onConfirm: () {
                                            // BerandaPageView.indexWidget.value == "proses";
                                            // controller.postAjuanPKL(controller
                                            //     .dataPrevDudi[index]["id"]);
                                            Get.back();
                                            // Get.offAllNamed(
                                            //   // Routes.AJUAN_PKL,
                                              
                                            //   // arguments:
                                            //   //     AllMaterial.box.write(
                                            //   //   "selectedData",
                                            //   //   controller
                                            //   //       .dataPrevDudi[index],
                                            //   // ),
                                            // );
                                          },
                                          // barrierDismissible: false,
                                          textCancel: "Batalkan",
                                          cancelTextColor: AllMaterial.colorBlue,
                                          textConfirm: "Konfirmasi",
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10,),
                                        decoration: BoxDecoration(
                                          color: AllMaterial.colorBlue,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        width: Get.width,
                                        height: 45,
                                        child: Center(
                                          child: Text(
                                            "Ajukan PKL",
                                            style: AllMaterial.montSerrat(
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                              color: AllMaterial.colorWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              //     :
                              // Container(
                              //   margin:
                              //       const EdgeInsets.symmetric(horizontal: 10),
                              //   decoration: BoxDecoration(
                              //     color: AllMaterial.colorGreySec,
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   width: Get.width,
                              //   height: 45,
                              //   child: Center(
                              //     child: Text(
                              //       "Ajukan PKL",
                              //       style: AllMaterial.montSerrat(
                              //         // fontFamily:
                              //         //     AllMaterial.fontFamily,
                              //         fontWeight: AllMaterial.fontSemiBold,
                              //         color: AllMaterial.colorGrey,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
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
                                // fontFamily: AllMaterial.fontFamily,
                                fontSize: 18,
                                fontWeight: AllMaterial.fontMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemCount: controller.dataCountPage.toInt(),
                  itemCount: 2,
                  itemBuilder: (context, index) => Obx(
                    () => GestureDetector(
                      onTap: () {
                        controller.changePage(index);
                        controller.update();
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
