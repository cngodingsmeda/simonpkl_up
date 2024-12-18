import 'package:flutter/material.dart';
import 'package:simon_pkl/all_material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({
    super.key,
    this.controller,
    required this.title,
    this.textController,
    required this.isEdit,
  });

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  bool isEdit = false;
  String title;
  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: AllMaterial.montSerrat(
            fontSize: 15,
            fontWeight: AllMaterial.fontSemiBold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          style: AllMaterial.montSerrat(
            fontWeight: AllMaterial.fontRegular,
          ),
          controller: textController,
          enabled: isEdit,
          cursorColor: AllMaterial.colorBlue,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffF1ECEC),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hoverColor: AllMaterial.colorBlue,
            focusColor: AllMaterial.colorBlue,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffF1ECEC),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
