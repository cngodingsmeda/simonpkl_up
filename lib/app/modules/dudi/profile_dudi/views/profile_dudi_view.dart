import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_dudi_controller.dart';

class ProfileDudiView extends GetView<ProfileDudiController> {
  const ProfileDudiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileDudiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfileDudiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
