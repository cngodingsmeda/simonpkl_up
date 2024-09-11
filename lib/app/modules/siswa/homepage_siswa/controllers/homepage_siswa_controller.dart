import 'package:get/get.dart';

class HomepageSiswaController extends GetxController {
  var status = "".obs;

  String statusPKL() {
    if (status.value == "sedang pkl") {
      return "sedang pkl";
    } else if (status.value == "menunggu pkl") {
      return "menunggu pkl";
    } else {
      return "belum pkl";
    }
  }
}
