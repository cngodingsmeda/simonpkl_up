import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/controller/general_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/widgets/profile_widgets.dart';

import '../controllers/profile_dudi_controller.dart';

class ProfileDudiView extends GetView<ProfileDudiController> {
  const ProfileDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileDudiController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          'Profil Saya',
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: "Logout",
            padding: const EdgeInsets.all(16),
            onPressed: () {
              var genController = Get.put(GeneralController());
              genController.logoutUser(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/haqi.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                        width: 4,
                        color: AllMaterial.colorBlue,
                      ),
                      color: AllMaterial.colorBlue,
                    ),
                    child: IconButton(
                      tooltip: "Edit Profil",
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        AllMaterial.messageScaffold(
                          title: "Fitur Sedang Digarap, Coming Soon",
                          context: context,
                        );
                      },
                      icon: const Icon(
                        size: 20,
                        Icons.edit,
                        color: AllMaterial.colorWhite,
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Fauzan Azqa",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        "Username : haqicuy",
                        style: AllMaterial.montSerrat(
                          fontWeight: AllMaterial.fontRegular,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileWidget(
                      controller: controller,
                      textController: controller.instansiC,
                      title: "Nama Instansi Perusahaan:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.noTeleponC,
                      title: "No. Telepon:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.bidangUsahaC,
                      title: "Bidang Instansi:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.deskrisiC,
                      title: "Deskripsi Instansi:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.alamatC,
                      title: "Alamat Instansi:",
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
