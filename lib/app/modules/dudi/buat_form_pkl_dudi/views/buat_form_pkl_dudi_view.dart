import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/model/model_dudi/kuota_pkl_siswa_dudi_model.dart';

import '../controllers/buat_form_pkl_dudi_controller.dart';

class BuatFormPklDudiView extends GetView<BuatFormPklDudiController> {
  const BuatFormPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isBuat = AllMaterial.box.read("isBuat") ?? false;
    var controller = Get.put(BuatFormPklDudiController());
    var data = Get.arguments;
    int id = data["id"];
    Kuota? dataRekrut = (id == 0) ? null : data["data"];
    bool isEnable = id == 0 ? false : true;

    print(id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "${isBuat ? "Buat" : "Edit"} Rekrut",
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
            AllMaterial.box.remove("isBuat");
          },
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
                      "Form Rekrut Siswa PKL",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Banyak Siswa:",
                              style: AllMaterial.montSerrat(
                                fontSize: 15,
                                color: AllMaterial.colorWhite,
                                fontWeight: AllMaterial.fontSemiBold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  _buildNumberField(
                                    "Laki-Laki",
                                    controller,
                                    true,
                                  ),
                                  const SizedBox(height: 20),
                                  _buildNumberField(
                                    "Perempuan",
                                    controller,
                                    false,
                                  ),
                                ],
                              ),
                            ),
                            _buildJurusanField(
                              controller,
                              dataRekrut,
                              data["id"] ?? 0,
                              isEnable,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            AllMaterial.cusDialogValidasi(
                              title: "Membuat Form Rekrut",
                              subtitle: "Apakah Anda yakin?",
                              onConfirm: () async {
                                bool isPost = (id == 0);
                                await controller.getKuotaSiswa(
                                  isPost: isPost,  context: context, 
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                            ),
                          ),
                          child: Text(
                            "Posting Rekrut Siswa",
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorBlue,
                              fontWeight: AllMaterial.fontSemiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildJurusanField(
    BuatFormPklDudiController controller, Kuota? kuota, int id, bool isEnable) {
  print(kuota?.jurusan?.nama);
  print(isEnable);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      Text(
        "Tentukkan Jurusan:",
        style: AllMaterial.montSerrat(
          fontSize: 15,
          color: AllMaterial.colorWhite,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      const SizedBox(height: 10),
      Obx(
        () => DropdownButtonFormField<String>(
          dropdownColor: AllMaterial.colorBlue,
          elevation: 0,
          value: null,
          isDense: true,
          hint: Text(
            (id == 0)
                ? "Pilih Jurusan"
                : AllMaterial.setiapHurufPertama(kuota?.jurusan?.nama ?? ""),
            style: AllMaterial.montSerrat(
              fontWeight: AllMaterial.fontMedium,
              color: AllMaterial.colorWhite,
            ),
          ),
          style: AllMaterial.montSerrat(
            color: AllMaterial.colorWhite,
          ),
          isExpanded: true,
          iconEnabledColor: AllMaterial.colorWhite,
          onChanged: id == 0
              ? (String? selectedId) {
                  if (selectedId != null) {
                    print("ID Jurusan yang dipilih: $selectedId");
                    controller.selectedJurusanId.value = selectedId;
                  }
                }
              : null,
          items: BuatFormPklDudiController.jurusan.value?.data
              ?.map<DropdownMenuItem<String>>((jurusan) {
            print(jurusan.nama);
            return DropdownMenuItem<String>(
              value: jurusan.id.toString(),
              child: Text(
                jurusan.nama == ""
                    ? ""
                    : AllMaterial.setiapHurufPertama(jurusan.nama),
                style: AllMaterial.montSerrat(
                  fontWeight: AllMaterial.fontMedium,
                  color: AllMaterial.colorWhite,
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            hintStyle: AllMaterial.montSerrat(
              color: AllMaterial.colorWhite,
              fontWeight: AllMaterial.fontMedium,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AllMaterial.colorWhite,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildNumberField(
    String label, BuatFormPklDudiController controller, bool isLaki) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
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
      Row(
        children: [
          Container(
            width: 100,
            alignment: Alignment.center,
            child: TextFormField(
              controller: isLaki ? controller.lakiC : controller.perempuanC,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontMedium,
                color: AllMaterial.colorWhite,
              ),
              cursorColor: AllMaterial.colorWhite,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AllMaterial.colorWhite),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AllMaterial.colorWhite),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
