import 'package:get/get.dart';

class LaporanAbsenSiswaGuruController extends GetxController {
  var selectedMonth = 7.obs;
  var historiAbsen = <Map<String, dynamic>>[].obs;
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
    // historiAbsen.value = allHistoriAbsen[month] ?? [];
  }
}
