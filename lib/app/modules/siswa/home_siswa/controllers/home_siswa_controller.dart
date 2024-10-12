import 'package:get/get.dart';

class HomeSiswaController extends GetxController {
  var indexPage = 0.obs;
  var keHistoriAbsen = false.obs;
  static var isLoading = true.obs;

  @override
  void onInit() {
    indexPage.value = 0;
    update();
    super.onInit();
  }

  @override
  void onClose() {
    indexPage.value = 0;
    update();
    super.onClose();
  }
}
