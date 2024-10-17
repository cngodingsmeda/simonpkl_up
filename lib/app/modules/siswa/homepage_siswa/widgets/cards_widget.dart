import 'package:flutter/material.dart';
import 'package:simon_pkl/all_material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.tanggal,
    required this.icon,
    required this.keterangan,
    this.onTap,
    this.onPress,
  });

  String keterangan;
  String tanggal;
  Widget icon;
  void Function()? onTap;
  void Function()? onPress;

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
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          onLongPress: onPress,
          child: ListTile(
            leading: icon,
            title: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              tanggal,
              style: AllMaterial.montSerrat(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              keterangan,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AllMaterial.montSerrat(),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
