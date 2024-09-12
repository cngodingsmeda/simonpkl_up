import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.tanggal,
    required this.icon,
    required this.keterangan,
  });

  String keterangan;
  String tanggal;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        surfaceTintColor: AllMaterial.colorWhite,
        color: AllMaterial.colorWhite,
        borderOnForeground: true,
        shadowColor: AllMaterial.colorGreySec,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          onTap: () => Get.to(()=> const DetilLaporanSiswaView()),
          leading: icon,
          title: Text(
            tanggal,
            style: AllMaterial.montSerrat(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            keterangan,
            style: AllMaterial.montSerrat(),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
