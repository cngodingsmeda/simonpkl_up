import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/kuota_umum_dudi_controller.dart';

class KuotaUmumDudiView extends GetView<KuotaUmumDudiController> {
  const KuotaUmumDudiView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KuotaUmumDudiController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Kuota Siswa",
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Form Kuota Umum PKL",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildKuotaFields(controller),
                    const SizedBox(height: 30),
                    _buildSubmitButton(controller, context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKuotaFields(KuotaUmumDudiController controller) {
    return Column(
      children: [
        _buildNumberField("Laki-Laki", controller.lakiC),
        const SizedBox(height: 20),
        _buildNumberField("Perempuan", controller.perempuanC),
      ],
    );
  }

  Widget _buildNumberField(String label, TextEditingController controller) {
    return Row(
      children: [
        Text(
          "$label:",
          style: AllMaterial.montSerrat(
            fontSize: 15,
            color: AllMaterial.colorWhite,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 100,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: AllMaterial.montSerrat(
              fontWeight: AllMaterial.fontMedium,
              color: AllMaterial.colorWhite,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AllMaterial.colorWhite),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AllMaterial.colorWhite),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(
      KuotaUmumDudiController controller, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        bool isUpdate = controller.id.value != 0;
        AllMaterial.cusDialogValidasi(
          title: "${isUpdate ? "Memperbarui" : "Membuat"} Kuota",
          subtitle: "Apakah Anda yakin?",
          onConfirm: () {
            controller.getKuotaSiswa(
              isPost: !isUpdate,
              isPut: isUpdate,
              context: context,
            );
            Get.back();
          },
          onCancel: () => Get.back(),
        );
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(Get.width),
        backgroundColor: AllMaterial.colorWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child: Text(
        "Kirim Form Kuota",
        style: AllMaterial.montSerrat(
          color: AllMaterial.colorBlue,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
    );
  }
}
