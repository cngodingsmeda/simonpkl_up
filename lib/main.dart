import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/cusplash_screen.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('Yid_ID', null);
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Simon PKL",
      getPages: AppPages.routes,
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

    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        logController.checkAuthentication();
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CusplashScreen();
        } else {
          return Obx(
            () {
              if (logController.isAuth.value == true) {
                return logController.periksaRole();
              } else {
                return const LoginPageView();
              }
            },
          );
        }
      },
    );
  }
}
