// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  // Message Scaffold
  static void messageScaffold({required String title}) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(title),
        ),
      );
    }
  }

  // Dialog
  static cusDialog({
    required String topTitle,
    required String path,
    required String dateTime,
    void Function()? onTap1,
    void Function()? onTap2,
  }) {
    return AlertDialog(
      backgroundColor: AllMaterial.colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            topTitle,
            style: AllMaterial.montSerrat(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SvgPicture.asset(
            path,
            color: AllMaterial.colorBlue,
          ),
          const SizedBox(height: 10),
          Text(
            dateTime,
            style: AllMaterial.montSerrat(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: AllMaterial.fontMedium),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AllMaterial.colorBlue,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: onTap1,
            child: Text(
              'Absen Masuk',
              style: AllMaterial.montSerrat(
                fontSize: 16,
                color: AllMaterial.colorWhite,
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AllMaterial.colorBlue,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: Colors.blue),
              ),
            ),
            onPressed: onTap2,
            child: Text(
              'Absen Pulang',
              style: AllMaterial.montSerrat(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // BOTTOM SHEET
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

  // DIALOG
  static void cusDialogValidasi({
    required String title,
    required String subtitle,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
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
              Text(
                title,
                textAlign: TextAlign.center,
                style: AllMaterial.montSerrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
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
                      onPressed: onCancel,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AllMaterial.colorBlue,
                        side: const BorderSide(color: AllMaterial.colorBlue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Batalkan',
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
                      onPressed: onConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllMaterial.colorBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Konfirmasi',
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
    );
  }

  // FORMAT TEXT
  static String formatAlamat(String? text) {
    if (text == null || text.isEmpty) {
      return '';
    }
    return text.split(', ').map((word) {
      return word.split(' ').map((part) {
        if (part.length == 3) {
          return part.toUpperCase();
        } else if (part.length == 2) {
          return part.toUpperCase();
        } else {
          return part[0].toUpperCase() + part.substring(1).toLowerCase();
        }
      }).join(' ');
    }).join(', ');
  }

  static String setiapHurufPertama(String? text) {
    return text!.split(' ').map((word) {
      if (text != "") {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }).join(' ');
  }

  static String setiapNamaHurufPertama(String? text) {
    if (text == null || text.isEmpty) {
      return '';
    }

    return text.split(' ').map((word) {
      if (word.length == 3 || word.length <= 3 && word.contains(".")) {
        return word.toUpperCase();
      } else {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }).join(' ');
  }

  static String hurufPertama(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String formatJam(String? waktu) {
    if (waktu == null || waktu.isEmpty) {
      return 'Belum Ditentukan';
    }
    try {
      final parsedTime = DateFormat('HH:mm').parse(waktu);
      return DateFormat('HH:mm').format(parsedTime);
    } catch (e) {
      return 'Format Tidak Valid';
    }
  }

  static String ubahTanggal(String isoDate) {
    DateTime parsedDate = DateTime.parse(isoDate);
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'id_ID').format(parsedDate);
    return formattedDate;
  }

  static String ubahHari(String isoDate) {
    DateTime parsedDate = DateTime.parse(isoDate);
    String formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(parsedDate);
    return formattedDate;
  }

  static String ubahJam(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat('HH:mm').format(dateTime);
    return formattedDate;
  }

  static String ubahJamMenitDetik(String timeString) {
    DateTime parsedTime = DateFormat("HH:mm:ss.S").parse(timeString);
    String formattedTime = DateFormat('HH:mm').format(parsedTime);
    return formattedTime;
  }

  static String ubahTanggaldanJam(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate =
        DateFormat('d MMMM yyyy - HH.mm', 'id_ID').format(dateTime);
    return formattedDate;
  }

  static String formatNamaPanjang(String namaPanjang) {
    List<String> namaArray = namaPanjang.split(' ');
    List<String> namaTigaPertama = namaArray.take(3).toList();
    List<String> inisialSisa =
        namaArray.skip(3).map((nama) => '${nama[0].toLowerCase()}.').toList();

    return (namaTigaPertama + inisialSisa).join(' ').toUpperCase();
  }

  static Widget setupPullToRefresh({
    required Future<void> Function() onRefresh,
    required Widget child,
  }) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }

  static String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Permintaan tidak valid. Periksa input Anda.";
      case 401:
        return "Anda tidak memiliki akses. Silakan login.";
      case 403:
        return "Anda tidak diizinkan untuk mengakses halaman ini.";
      case 404:
        return "Data tidak ditemukan.";
      case 408:
        return "Waktu habis. Silakan coba lagi.";
      case 500:
        return "Terjadi kesalahan pada server. Silakan coba lagi nanti.";
      case 502:
        return "Server sedang tidak dapat diakses. Coba lagi nanti.";
      case 503:
        return "Layanan sedang tidak tersedia. Silakan coba beberapa saat lagi.";
      case 504:
        return "Server tidak merespons tepat waktu. Silakan coba lagi.";
      default:
        return "Terjadi kesalahan tidak diketahui.";
    }
  }
}
