import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/cusplash_screen.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(
    FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GetMaterialApp(
            home: const CusplashScreen(),
            title: "Simon PKL",
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        } else {
          return GetMaterialApp(      
            home: const LoginPageView(),
            title: "Simon PKL",
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        }
      },
    ),
  );
}