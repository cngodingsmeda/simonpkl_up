import 'package:get/get.dart';

class PilihDudiSiswaController extends GetxController {
  var intPage = 0.obs;

    void changePage(int page) async {
    intPage.value = page;
    // await fetchData();
  }
}
