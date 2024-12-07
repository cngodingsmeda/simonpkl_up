import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _startMonitoring();
  }

  void _startMonitoring() {
    Connectivity().onConnectivityChanged.listen((status) async {
      isConnected.value = await checkInternetAccess();
    });

    checkInternetAccess().then((value) => isConnected.value = value);
  }

  Future<bool> checkInternetAccess() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
