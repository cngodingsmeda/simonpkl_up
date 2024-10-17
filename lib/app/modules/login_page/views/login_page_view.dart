import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginPageController());

    return Scaffold(
      backgroundColor: AllMaterial.colorWhite,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.85,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.04),
                        blurRadius: 20,
                        offset: const Offset(-12, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          "Login",
                          style: AllMaterial.montSerrat(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AllMaterial.colorBlue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Username Field
                      TextField(
                        selectionControls: MaterialTextSelectionControls(),
                        controller: loginController.userC,
                        focusNode: loginController.userF,
                        cursorColor: AllMaterial.colorBlue,
                        textInputAction: TextInputAction.next,
                        onTapOutside: (_) {
                          loginController.userF.unfocus();
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AllMaterial.colorBlue,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hoverColor: AllMaterial.colorBlue,
                          labelText: 'Username',
                          labelStyle: AllMaterial.montSerrat(
                            color: AllMaterial.colorBlack.withOpacity(0.6),
                            fontWeight: AllMaterial.fontMedium,
                          ),
                          focusColor: AllMaterial.colorBlue,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffF1ECEC),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      Obx(() => TextField(
                            controller: loginController.passC,
                            focusNode: loginController.passF,
                            obscureText: loginController.isPasswordHidden.value,
                            onTapOutside: (e) {
                              loginController.passF.unfocus();
                            },
                            cursorColor: AllMaterial.colorBlue,
                            decoration: InputDecoration(
                              hoverColor: AllMaterial.colorBlue,
                              focusColor: AllMaterial.colorBlue,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AllMaterial.colorBlue,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              labelText: 'Password',
                              labelStyle: AllMaterial.montSerrat(
                                color: AllMaterial.colorBlack.withOpacity(0.6),
                                fontWeight: AllMaterial.fontMedium,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: const Color(0xffF1ECEC)
                                        .withOpacity(0.1)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginController.isPasswordHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed:
                                    loginController.togglePasswordVisibility,
                              ),
                            ),
                          )),
                      const SizedBox(height: 30),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: ()=> loginController.login(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            textStyle: const TextStyle(fontSize: 18),
                            backgroundColor: AllMaterial.colorBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: AllMaterial.montSerrat(
                              color: AllMaterial.colorWhite,
                              fontWeight: AllMaterial.fontMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
