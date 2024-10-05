import 'package:get/get.dart';

class HomeDudiController extends GetxController {
  var indexPage = 0.obs;

  @override
  void onClose() {
    indexPage.value = 0;
    super.onClose();
  }
}
