import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/pilih_dudi_model.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/views/ajuan_siswa_view.dart';

class PilihDudiSiswaController extends GetxController {
  var dudi = Rx<PilihDudiModel?>(null);
  var filteredDudi = <Datum>[].obs;
  var isLoading = true.obs;
  var isSearching = false.obs;
  String token = AllMaterial.box.read("token");
  var intPage = 0.obs;
  var searchController = TextEditingController();
  var availableFilter = false.obs;

  @override
  void onClose() {
    intPage.value = 0;
    searchController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    fetchDudiList();
    super.onInit();
  }

  Future<void> fetchDudiList() async {
    intPage.value++;
    isLoading.value = true;
    final response = await http.get(
      Uri.parse(
          "${ApiUrl.urlGetAllDudiSiswa}?page=${intPage.value}&nama_instansi_perusahaan=${searchController.text}&bidang_usaha=${searchController.text}"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      var pilihDudiModel = PilihDudiModel.fromJson(data["data"]);
      dudi.value = pilihDudiModel;
      applyFilters();
      isLoading.value = false;
    } else {
      isLoading.value = false;
      print("Gagal menampilkan data");
      throw Exception('Failed to load data');
    }
  }

  Future<void> ajukanPKL(int id) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlPostAjuanPklSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "id_dudi": id,
        },
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Get.back();
      Get.off(() => const AjuanSiswaView(), arguments: data["data"]["id"]);
      print(data);
    } else {
      print("Gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  void changePage(int index) {
    intPage.value = index;
    fetchDudiList();
  }

  void toggleSearch() {
    isSearching.value = !isSearching.value;
    fetchDudiList();
    if (!isSearching.value) clearSearch();
    update();
  }

  void toggleAvailabilityFilter() {
    availableFilter.value = !availableFilter.value;
    applyFilters();
  }

  void clearSearch() {
    searchController.clear();
    isSearching.value = false;
    applyFilters();
  }

  void searchDudi(String query) {
    searchController.text = query;
    applyFilters();
  }

  void applyFilters() {
    var results = dudi.value?.data ?? [];
    if (searchController.text.isNotEmpty) {
      results = results
          .where((dudi) =>
              dudi.namaInstansiPerusahaan
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()) ||
              dudi.bidangUsaha
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase()))
          .toList();
    }
    if (availableFilter.value) {
      results = results.where((dudi) => dudi.tersedia == true).toList();
    }

    filteredDudi.assignAll(results);
    update();
  }
}
