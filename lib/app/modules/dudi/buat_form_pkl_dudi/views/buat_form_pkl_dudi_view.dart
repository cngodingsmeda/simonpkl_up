import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/buat_form_pkl_dudi_controller.dart';

class BuatFormPklDudiView extends GetView<BuatFormPklDudiController> {
  const BuatFormPklDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isJadwal = AllMaterial.box.read("isJadwal") ?? false;
    var controller = Get.put(BuatFormPklDudiController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Buat ${isJadwal ? 'Jadwal' : "Rekrut"} Baru",
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
            AllMaterial.box.remove("isJadwal");
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
                      isJadwal ? "Form Jadwal Absen" : "Form Rekrut Siswa PKL",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isJadwal
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Menambahkan hari dan jam masuk/pulang
                                  Obx(
                                    () => Column(
                                      children: List.generate(
                                        controller.jumlahFormJadwal.value,
                                        (index) {
                                          return FieldDayAbsen(
                                            controller: controller,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => controller.jumlahFormJadwal.value ==
                                            controller.hariList.length
                                        ? const SizedBox.shrink()
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: TextButton(
                                              onPressed: () {
                                                controller.addNewDay();
                                              },
                                              child: Text(
                                                "+ Tambah Hari",
                                                style: AllMaterial.montSerrat(
                                                  color: AllMaterial.colorWhite,
                                                  fontWeight:
                                                      AllMaterial.fontSemiBold,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Input jurusan dan jumlah siswa
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
                                        ),
                                        const SizedBox(height: 20),
                                        _buildNumberField(
                                          "Perempuan",
                                          controller,
                                        ),
                                      ],
                                    ),
                                  ),
                                  _buildJurusanField(controller),
                                  Obx(() => controller.jumlahJurusan ==
                                          controller.jurusanList.length
                                      ? const SizedBox.shrink()
                                      : TextButton(
                                          onPressed: () {
                                            // controller.addJurusan();
                                          },
                                          child: Text(
                                            "+ Tambah Jurusan",
                                            style: AllMaterial.montSerrat(
                                              color: AllMaterial.colorWhite,
                                              fontWeight:
                                                  AllMaterial.fontSemiBold,
                                            ),
                                          ),
                                        )),
                                ],
                              ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () {
                            // Aksi untuk kirim data
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
                            isJadwal
                                ? "Posting Form Jadwal"
                                : "Posting Rekrut Siswa",
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

class FieldDayAbsen extends StatelessWidget {
  const FieldDayAbsen({
    super.key,
    required this.controller,
  });

  final BuatFormPklDudiController controller;

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
        _buildTimePicker(
          "Atur Jam Masuk:",
          controller,
          true,
        ),
        const SizedBox(height: 20),
        _buildTimePicker(
          "Atur Jam Pulang:",
          controller,
          false,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

Widget _buildDropdownField(BuatFormPklDudiController controller, String label,
    List<String> items, String? selectedItem) {
  print(selectedItem);
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
      DropdownButtonFormField<String>(
        dropdownColor: AllMaterial.colorBlue,
        value: items[0],
        style: AllMaterial.montSerrat(
          color: AllMaterial.colorWhite,
        ),
        iconEnabledColor: AllMaterial.colorWhite,
        onChanged: (String? newValue) {
          controller.selectedTopik.value = newValue!;
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: AllMaterial.montSerrat(
                fontWeight: AllMaterial.fontMedium,
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
            borderSide: const BorderSide(color: AllMaterial.colorWhite),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AllMaterial.colorWhite),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ],
  );
}

Widget _buildJurusanField(BuatFormPklDudiController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      Text(
        "Tentukkan Jurusan (Opsional) :",
        style: AllMaterial.montSerrat(
          fontSize: 15,
          color: AllMaterial.colorWhite,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      const SizedBox(height: 10),
      DropdownButtonFormField<String>(
        isDense: true,
        padding: EdgeInsets.zero,
        dropdownColor: AllMaterial.colorBlue,
        elevation: 0,
        isExpanded: true,
        value: controller.jurusanList[0],
        style: AllMaterial.montSerrat(
          color: AllMaterial.colorWhite,
        ),
        // iconSize: 12,
        iconEnabledColor: AllMaterial.colorWhite,
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.selectedTopik.value = newValue;
          }
        },
        items: controller.jurusanList
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
  );
}

Widget _buildTimePicker(
    String label, BuatFormPklDudiController controller, bool isJamMasuk) {
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
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: Get.context!,
                  initialTime: TimeOfDay.now(),
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child ?? const SizedBox(),
                    );
                  },
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
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AllMaterial.colorWhite),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Obx(() {
                  String timeString = _formatTime(
                    isJamMasuk
                        ? controller.jamMasukAwal.value
                        : controller.jamPulangAwal.value,
                  );
                  return Text(
                    timeString,
                    style: AllMaterial.montSerrat(
                      color: AllMaterial.colorWhite,
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "-",
            style: AllMaterial.montSerrat(
              color: AllMaterial.colorWhite,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: Get.context!,
                  initialTime: TimeOfDay.now(),
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child ?? const SizedBox(),
                    );
                  },
                );
                if (pickedTime != null) {
                  if (isJamMasuk) {
                    controller.jamMasukAkhir.value = pickedTime;
                  } else {
                    controller.jamPulangAkhir.value = pickedTime;
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: AllMaterial.colorWhite),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Obx(() {
                  String timeString = _formatTime(
                    isJamMasuk
                        ? controller.jamMasukAkhir.value
                        : controller.jamPulangAkhir.value,
                  );
                  return Text(
                    timeString,
                    style: AllMaterial.montSerrat(
                      color: AllMaterial.colorWhite,
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

// Fungsi untuk memformat waktu ke format 24 jam
String _formatTime(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

// Fungsi untuk NumberField (Laki-Laki/Perempuan)
Widget _buildNumberField(String label, BuatFormPklDudiController controller) {
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
              initialValue: "0",
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
