import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/controller/general_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/widgets/profile_widgets.dart';

import '../controllers/profile_guru_controller.dart';

class ProfileGuruView extends GetView<ProfileGuruController> {
  const ProfileGuruView({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileGuruController());
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
              AllMaterial.cusDialogValidasi(
                title: "Logout",
                subtitle: "Apakah Anda ingin keluar dari akun saat ini?",
                onConfirm: () => genController.logout(context),
                onCancel: () => Get.back(),
              );
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
                      image: DecorationImage(
                        image: (controller.profil.value?.fotoProfile != null)
                            ? NetworkImage(controller.profil.value!.fotoProfile
                                .toString()
                                .replaceAll("localhost", "10.0.2.2"))
                            : const AssetImage(
                                "assets/images/foto-profile.png",
                              ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                        width: 4,
                        color: AllMaterial.colorBlue,
                      ),
                      color: AllMaterial.colorBlue,
                    ),
                    // child: IconButton(
                    //   tooltip: "Edit Profil",
                    //   style: const ButtonStyle(
                    //     padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    //   ),
                    //   onPressed: () {
                    //     AllMaterial.messageScaffold(
                    //       title: "Fitur Sedang Digarap, Coming Soon",
                    //       context: context,
                    //     );
                    //   },
                    //   icon: const Icon(
                    //     size: 20,
                    //     Icons.edit,
                    //     color: AllMaterial.colorWhite,
                    //   ),
                    // ),
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          AllMaterial.formatNamaPanjang(
                            controller.profil.value?.nama?.toUpperCase() ?? "",
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AllMaterial.montSerrat(
                            fontWeight: AllMaterial.fontBold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        "NIP : ${controller.profil.value?.nip ?? ""}",
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
                      title: "Instansi:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.npsnInstansiC,
                      title: "NPSN Instansi:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.noTeleponC,
                      title: "No. Telepon:",
                    ),
                    ProfileWidget(
                      controller: controller,
                      textController: controller.alamatC,
                      title: "Alamat:",
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
