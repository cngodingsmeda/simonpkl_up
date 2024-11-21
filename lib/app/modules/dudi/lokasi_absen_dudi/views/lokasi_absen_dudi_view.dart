import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/lokasi_absen_dudi_controller.dart';

class LokasiAbsenDudiView extends GetView<LokasiAbsenDudiController> {
  const LokasiAbsenDudiView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LokasiAbsenDudiController());
    controller.getUserCurrentLocation();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AllMaterial.colorWhite,
        surfaceTintColor: AllMaterial.colorWhite,
        title: Text(
          "Lokasi Absen",
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
                      "Form Lokasi Absen PKL",
                      style: AllMaterial.montSerrat(
                        color: AllMaterial.colorWhite,
                        fontWeight: AllMaterial.fontSemiBold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildLokasiFields(controller),
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

  Widget _buildLokasiFields(LokasiAbsenDudiController controller) {
    return Column(
      children: [
        _buildNumberField("Nama Tempat Absen", controller.namaTempatC, false),
        const SizedBox(height: 20),
        _buildNumberField("Radius Absen (Meter)", controller.radiusAbsen, true),
        const SizedBox(height: 20),
        _buildLokasiField(controller),
        const SizedBox(height: 10),
        TextButton(
          onPressed: controller.toggleManualLocation,
          child: Text(
            "Tentukan Lokasi Manual",
            style: AllMaterial.montSerrat(
              color: Colors.white,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
        ),
        Obx(() {
          return controller.manualLocationEnabled.value
              ? Column(
                  children: [
                    _buildNumberField(
                        "Latitude", controller.latitudeController, true),
                    const SizedBox(height: 10),
                    _buildNumberField(
                        "Longitude", controller.longitudeController, true),
                    const SizedBox(height: 20),
                  ],
                )
              : const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _buildLokasiField(LokasiAbsenDudiController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lokasi Absen:",
          style: AllMaterial.montSerrat(
            fontSize: 15,
            color: AllMaterial.colorWhite,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: Obx(() {
            return FlutterMap(
              options: MapOptions(
                initialCenter: controller.currentLocation.value,
                initialZoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: controller.currentLocation.value,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

Widget _buildNumberField(
    String label, TextEditingController controller, bool isRadius) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "$label:",
        style: AllMaterial.montSerrat(
          fontSize: 15,
          color: AllMaterial.colorWhite,
          fontWeight: AllMaterial.fontSemiBold,
        ),
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: controller,
        textInputAction: isRadius ? TextInputAction.done : TextInputAction.next,
        keyboardType: isRadius ? TextInputType.number : TextInputType.text,
        style: AllMaterial.montSerrat(
          fontWeight: AllMaterial.fontMedium,
          color: AllMaterial.colorWhite,
        ),
        decoration: InputDecoration(
          hintText: "Masukkan $label",
          hintStyle: AllMaterial.montSerrat(
            color: AllMaterial.colorWhite,
          ),
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
    ],
  );
}

Widget _buildSubmitButton(
    LokasiAbsenDudiController controller, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      bool isUpdate = controller.id.value != 0;
      AllMaterial.cusDialogValidasi(
        title: "${isUpdate ? "Memperbarui" : "Membuat"} Lokasi",
        subtitle: "Apakah Anda yakin?",
        onConfirm: () {
          controller.getKoordinatAbsen(
            isPost: !isUpdate,
            isPut: isUpdate,
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
      "Posting Lokasi Absen",
      style: AllMaterial.montSerrat(
        color: AllMaterial.colorBlue,
        fontWeight: AllMaterial.fontSemiBold,
      ),
    ),
  );
}
