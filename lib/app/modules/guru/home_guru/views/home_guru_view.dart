import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/homepage_guru/views/homepage_guru_view.dart';
import 'package:simon_pkl/app/modules/guru/laporan_absen_siswa_guru/views/laporan_absen_siswa_guru_view.dart';
import 'package:simon_pkl/app/modules/guru/profile_guru/views/profile_guru_view.dart';

import '../controllers/home_guru_controller.dart';

class HomeGuruView extends GetView<HomeGuruController> {
  HomeGuruView({super.key});
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const HomepageGuruView(),
      const LaporanAbsenSiswaGuruView(),
      const ProfileGuruView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        scrollToTopOnNavBarItemPress: true,
        icon: Obx(
          () => SvgPicture.asset(
            controller.indexPage.value == 0
                ? "assets/icons/home_fill.svg"
                : "assets/icons/home.svg",
            fit: BoxFit.fitHeight,
          ),
        ),
        title: ("Beranda"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        scrollToTopOnNavBarItemPress: true,
        icon: SvgPicture.asset(
          "assets/icons/laporan.svg",
          // ignore: deprecated_member_use
          color: AllMaterial.colorWhite,
        ),
        title: ("Absen Siswa"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        scrollToTopOnNavBarItemPress: true,
        icon: Obx(
          () => SvgPicture.asset(
            controller.indexPage.value == 2
                ? "assets/icons/profil_fill.svg"
                : "assets/icons/profil.svg",
            fit: BoxFit.fitHeight,
          ),
        ),
        title: ("Profil"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeGuruController());
    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      body: PersistentTabView(
        confineToSafeArea: true,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(top: 6, bottom: 2),
        context,
        controller: _controller,
        onItemSelected: (value) {
          controller.indexPage.value = value;
        },
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
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(-12, -5),
            )
          ],
        ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
