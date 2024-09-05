import 'package:flutter/material.dart';
import 'package:simon_pkl/all_material.dart';

class CusplashScreen extends StatelessWidget {
  const CusplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllMaterial.colorBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 105,
              height: 105,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/LogoSIMONWhite.png"),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: "Simon",
                style: AllMaterial.montSerrat(
                  color: AllMaterial.colorWhite,
                  fontSize: 30,
                ),
                children: [
                  TextSpan(
                    text: "PKL",
                    style: AllMaterial.montSerrat(
                      color: AllMaterial.colorWhite,
                      fontSize: 30,
                      fontWeight: AllMaterial.fontMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
