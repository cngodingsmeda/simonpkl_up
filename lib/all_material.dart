import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

abstract class AllMaterial {
  // Get Storage
  static var box = GetStorage();

  // Font Family
  static var montSerrat = GoogleFonts.montserrat;

  // Font Weight
  static const fontExtraBold = FontWeight.w800;
  static const fontBold = FontWeight.w700;
  static const fontSemiBold = FontWeight.w600;
  static const fontMedium = FontWeight.w500;
  static const fontRegular = FontWeight.w400;

  // Color
  static const colorBlue = Color(0xff38A3FF);
  static const colorGrey = Color(0xff676D75);
  static const colorWhite = Colors.white;
  static const colorGreySec = Color(0xffF7F7F7);
  static const colorBlack = Color(0xff1B1D2A);
  static const colorGreen = Color(0xff15DF1D);
  static const colorRed = Color(0xffE31D1D);

  // Shadow
  static var boxShadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.48),
    offset: const Offset(0, 4),
    blurRadius: 20,
    spreadRadius: -10,
  );

  // Bottom Sheet
  static messageScaffold({
    required String title,
    required BuildContext context,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(title),
      ),
    );
  }

  static cusBottomSheet({
    required String text,
    required String subtitle,
  }) {
    return Get.bottomSheet(BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AllMaterial.colorWhite,
            borderRadius: BorderRadius.circular(25),
          ),
          width: Get.width,
          height: 120,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: AllMaterial.montSerrat(
                  fontSize: 17,
                  fontWeight: AllMaterial.fontBold,
                ),
              ),
              const SizedBox(height: 5),
              Text(subtitle),
            ],
          ),
        );
      },
    ));
  }

  static String setiapHurufPertama(String text) {
    return text.split(' ').map((word) {
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  static String hurufPertama(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String ubahTanggal(String isoDate) {
    DateTime parsedDate = DateTime.parse(isoDate);
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(parsedDate);
    return formattedDate;
  }

  static String ubahJam(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('HH:mm').format(dateTime);
    return formattedDate;
  }

  static String ubahTanggaldanJam(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate =
        DateFormat('d MMMM yyyy - HH.mm', 'id_ID').format(dateTime);
    return formattedDate;
  }
}
