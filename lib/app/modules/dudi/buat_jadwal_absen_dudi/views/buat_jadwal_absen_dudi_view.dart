import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/buat_jadwal_absen_dudi_controller.dart';

class BuatJadwalAbsenDudiView extends GetView<BuatJadwalAbsenDudiController> {
  const BuatJadwalAbsenDudiView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BuatJadwalAbsenDudiController());
    controller.getJadwalAbsenById();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        title: Text(
          "${controller.idPut.value == 0 ? "Buat" : "Edit"} Jadwal Absen",
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
                  children: [
                    Text(
                      "Form Jadwal Absen PKL",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FieldDayAbsen(
                      controller: controller,
                    ),
                    const SizedBox(height: 30),
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

class FieldDayAbsen extends StatelessWidget {
  const FieldDayAbsen({super.key, required this.controller});

  final BuatJadwalAbsenDudiController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDropdownField(
          controller,
          "Hari Absen:",
          controller.hariList,
          controller.selectedTopik.value,
        ),
        const SizedBox(height: 20),
        _buildTimePicker(controller, true),
        const SizedBox(height: 20),
        _buildTimePicker(controller, false),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Min. Jam Kerja (Jam) :",
              style: AllMaterial.montSerrat(
                fontSize: 15,
                color: AllMaterial.colorWhite,
                fontWeight: AllMaterial.fontSemiBold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              controller: controller.minJamAbsenC,
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontMedium,
                color: AllMaterial.colorWhite,
                fontSize: 15,
              ),
              cursorColor: AllMaterial.colorWhite,
              decoration: InputDecoration(
                hintText: "1",
                hintStyle: AllMaterial.montSerrat(
                  color: AllMaterial.colorWhite,
                  fontWeight: AllMaterial.fontMedium,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AllMaterial.colorWhite,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
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
          ],
        ),
        const SizedBox(height: 20),
        Obx(
          () {
            bool isUpdate = controller.idPut.value != 0;

            print(controller.isEnable.value);
            return isUpdate
                ? GestureDetector(
                    onTap: () => controller.isEnable.toggle(),
                    child: Row(
                      children: [
                        Checkbox(
                          fillColor: const WidgetStatePropertyAll(
                            AllMaterial.colorBlue,
                          ),
                          value: controller.isEnable.value,
                          onChanged: (value) {
                            print(value);
                            controller.ubahStatusJadwalAbsen(
                                value ?? controller.isEnable.value);
                          },
                          checkColor: Colors.white,
                          side: const BorderSide(
                            color: AllMaterial.colorWhite,
                            width: 2,
                          ),
                          activeColor: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            'Tandai sebagai "Jadwal Aktif"',
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorWhite,
                              fontWeight: AllMaterial.fontMedium,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 20),
        _buildSubmitButton(controller, context),
      ],
    );
  }
}

Widget _buildTimePicker(
    BuatJadwalAbsenDudiController controller, bool isJamMasuk) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        isJamMasuk ? "Batas Absen Masuk:" : "Batas Absen Pulang:",
        style: AllMaterial.montSerrat(
          fontSize: 15,
          color: AllMaterial.colorWhite,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      GestureDetector(
        onTap: () async {
          TimeOfDay? pickedTime = await showTimePicker(
            context: Get.context!,
            initialTime: TimeOfDay.now(),
            builder: (context, child) => MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child ?? const SizedBox(),
            ),
          );
          if (pickedTime != null) {
            if (isJamMasuk) {
              controller.jamMasukAwal.value = pickedTime;
            } else {
              controller.jamPulangAwal.value = pickedTime;
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: AllMaterial.colorWhite),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Obx(() {
            String timeString = _formatTime(
              isJamMasuk
                  ? controller.jamMasukAwal.value
                  : controller.jamPulangAwal.value,
            );
            return Text(
              timeString,
              style: AllMaterial.montSerrat(color: AllMaterial.colorWhite),
            );
          }),
        ),
      ),
    ],
  );
}

String _formatTime(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

Widget _buildSubmitButton(
    BuatJadwalAbsenDudiController controller, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      bool isUpdate = controller.idPut.value != 0;
      AllMaterial.cusDialogValidasi(
        title: "${isUpdate ? "Memperbarui" : "Membuat"} Jadwal",
        subtitle: "Apakah Anda yakin?",
        onConfirm: () {
          controller.getJadwalAbsenById(
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
      "Kirim Form Jadwal",
      style: AllMaterial.montSerrat(
        color: AllMaterial.colorBlue,
        fontWeight: AllMaterial.fontSemiBold,
      ),
    ),
  );
}

Widget _buildDropdownField(BuatJadwalAbsenDudiController controller,
    String label, List<String> items, String? selectedItem) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AllMaterial.montSerrat(
          fontSize: 15,
          color: AllMaterial.colorWhite,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      const SizedBox(height: 10),
      Obx(() {
        return DropdownButtonFormField<String>(
          dropdownColor: AllMaterial.colorBlue,
          value: controller.selectedTopik.value,
          iconEnabledColor: AllMaterial.colorWhite,
          style: AllMaterial.montSerrat(color: AllMaterial.colorWhite),
          onChanged: controller.idPut.value == 0
              ? (String? newValue) {
                  controller.selectedTopik.value = newValue!;
                }
              : null,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: AllMaterial.montSerrat(
                  color: AllMaterial.colorWhite,
                ),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AllMaterial.colorWhite),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        );
      }),
    ],
  );
}
