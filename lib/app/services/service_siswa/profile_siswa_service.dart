// service/api_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:simon_pkl/app/model/model_siswa/profile_siswa_model.dart';

class ProfileSiswaService {
  static Future<Profil> fetchProfilSiswa(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Profil.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load profil');
    }
  }
}
