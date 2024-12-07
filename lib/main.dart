import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/controller/network_controller.dart';
import 'package:simon_pkl/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/cusplash_screen.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Simon PKL",
      getPages: AppPages.routes,
      locale: const Locale('id_ID'),
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AllMaterial.colorBlue,
          selectionHandleColor: AllMaterial.colorBlue,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const InitPage(),
    ),
  );
}

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    var logController = Get.put(LoginPageController());
    var networkController = Get.put(NetworkController());

    // Flag untuk mendeteksi apakah aplikasi sudah selesai inisialisasi
    bool isAppInitialized = false;

    return Obx(() {
      // Tampilkan dialog jika koneksi terputus setelah aplikasi berjalan
      if (!networkController.isConnected.value && isAppInitialized) {
        Future.delayed(Duration.zero, () {
          if (!Get.isDialogOpen!) {
            Get.dialog(
              Dialog(
                backgroundColor: AllMaterial.colorWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.wifi_off,
                        size: 50,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Tidak Ada Koneksi Internet",
                        textAlign: TextAlign.center,
                        style: AllMaterial.montSerrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Harap nyalakan Wi-Fi atau data seluler.",
                        textAlign: TextAlign.center,
                        style: AllMaterial.montSerrat(
                          fontSize: 16,
                          fontWeight: AllMaterial.fontMedium,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Get.back();
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    if (Platform.isAndroid) {
                                      SystemNavigator.pop();
                                    } else if (Platform.isIOS) {
                                      exit(0);
                                    }
                                  },
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AllMaterial.colorBlue,
                                side: const BorderSide(
                                  color: AllMaterial.colorBlue,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                'Keluar',
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorBlue,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                networkController.checkInternetAccess();
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AllMaterial.colorBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                'Coba Lagi',
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              barrierDismissible: false,
            );
          }
        });
      }

      // Proses inisialisasi awal aplikasi
      return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !isAppInitialized) {
            // Tampilkan CusplashScreen hanya saat pertama kali aplikasi dimuat
            if (networkController.isConnected.value) {
              return const CusplashScreen();
            } else {
              // Jangan tampilkan splash jika tidak ada koneksi saat startup
              Future.delayed(Duration.zero, () {
                if (!Get.isDialogOpen!) {
                  Get.dialog(
                    Dialog(
                      backgroundColor: AllMaterial.colorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.wifi_off,
                              size: 50,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Tidak Ada Koneksi Internet",
                              textAlign: TextAlign.center,
                              style: AllMaterial.montSerrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Harap nyalakan Wi-Fi atau data seluler.",
                              textAlign: TextAlign.center,
                              style: AllMaterial.montSerrat(
                                fontSize: 16,
                                fontWeight: AllMaterial.fontMedium,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                networkController.checkInternetAccess();
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AllMaterial.colorBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Coba Lagi',
                                style: AllMaterial.montSerrat(
                                  fontWeight: AllMaterial.fontMedium,
                                  color: AllMaterial.colorWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    barrierDismissible: false,
                  );
                }
              });
              return const Scaffold(
                backgroundColor: AllMaterial.colorWhite,
                body: Center(
                  child: CircularProgressIndicator(
                    color: AllMaterial.colorBlue,
                  ),
                ),
              );
            }
          }
          
          isAppInitialized = true;

          // Jika selesai inisialisasi, lanjutkan ke halaman utama atau login
          logController.checkAuthentication();
          return PopScope(
            canPop: true,
            child: Obx(
              () {
                if (logController.isAuth.value) {
                  return logController.periksaRole();
                } else {
                  return const LoginPageView();
                }
              },
            ),
          );
        },
      );
    });
  }
}
