import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

class GeneralController extends GetxController {
  var box = AllMaterial.box;

  void authUser() async {
    var authUser = await box.read("authUser");
    if (authUser == "siswa") {
      print("siswa");
    } else if (authUser == "guru") {
      print("guru");
    } else if (authUser == "dudi") {
      print("dudi");
    }
  }
}
