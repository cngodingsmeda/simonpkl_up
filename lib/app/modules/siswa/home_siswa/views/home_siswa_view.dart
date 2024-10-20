// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/controller/general_controller.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/views/histori_absen_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/views/homepage_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/views/profile_siswa_view.dart';

import '../controllers/home_siswa_controller.dart';

class HomeSiswaView extends GetView<HomeSiswaController> {
  HomeSiswaView({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final ProfileSiswaController profCont = Get.put(ProfileSiswaController());
  final HomeSiswaController homeController = Get.put(HomeSiswaController());
  final GeneralController genController = Get.put(GeneralController());

  List<Widget> _buildScreens() => [
        const HomepageSiswaView(),
        const HistoriAbsenSiswaView(),
        const ProfileSiswaView(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          scrollToTopOnNavBarItemPress: true,
          icon: Obx(
            () => SvgPicture.asset(
              homeController.indexPage.value == 0
                  ? "assets/icons/home_fill.svg"
                  : "assets/icons/home.svg",
              fit: BoxFit.fitHeight,
            ),
          ),
          textStyle: AllMaterial.montSerrat(fontWeight: AllMaterial.fontMedium),
          title: ("Beranda"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          scrollToTopOnNavBarItemPress: true,
          icon: SvgPicture.asset(
            "assets/icons/histori-absen.svg",
            color: AllMaterial.colorWhite,
          ),
          textStyle: AllMaterial.montSerrat(fontWeight: AllMaterial.fontMedium),
          title: ("Histori Absen"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          scrollToTopOnNavBarItemPress: true,
          icon: Obx(
            () => SvgPicture.asset(
              homeController.indexPage.value == 2
                  ? "assets/icons/profil_fill.svg"
                  : "assets/icons/profil.svg",
              fit: BoxFit.fitHeight,
            ),
          ),
          textStyle: AllMaterial.montSerrat(fontWeight: AllMaterial.fontMedium),
          title: ("Profil"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    profCont.fetchProfilSiswa();
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: Obx(() {
        if (profCont.isLoading.value) {
          return _splashWait();
        } else if (profCont.profil.value != null) {
          return _buildPersistentTabView(context);
        } else {
          return _buildErrorScreen(profCont.statusCode.value);
        }
      }),
    );
  }

  Widget _buildPersistentTabView(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(top: 6, bottom: 2),
      onItemSelected: (value) => homeController.indexPage.value = value,
      stateManagement: true,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : 60.0,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(15.0),
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(-12, -5),
          )
        ],
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }

  Widget _buildErrorScreen(int statusCode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 50),
          const SizedBox(height: 15),
          Text(
            genController.getErrorMessage(statusCode),
            textAlign: TextAlign.center,
            style: AllMaterial.montSerrat(
              fontSize: 18,
              fontWeight: AllMaterial.fontMedium,
            ),
          ),
          const SizedBox(height: 15),
          _buildExitButton(),
        ],
      ),
    );
  }

  Widget _splashWait() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: CircularProgressIndicator(
            color: AllMaterial.colorBlue,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Mohon tunggu sebentar...",
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
      ],
    );
  }

  ElevatedButton _buildExitButton() {
    return ElevatedButton(
      onPressed: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AllMaterial.colorBlue,
        side: const BorderSide(color: AllMaterial.colorWhite),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child: Text(
        "Keluar",
        style: AllMaterial.montSerrat(
          color: AllMaterial.colorWhite,
          fontWeight: AllMaterial.fontMedium,
        ),
      ),
    );
  }
}
