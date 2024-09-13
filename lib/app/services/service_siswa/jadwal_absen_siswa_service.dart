import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';

import 'package:simon_pkl/app/model/model_siswa/jadwal_absen_siswa.dart';

class JadwalAbsenSiswaService {
  Future<JadwalAbsenSiswa> fetchInstansiData() async {
    final response =
        await http.get(Uri.parse(ApiUrl.urlGetJadwalAbsen));

    if (response.statusCode == 200) {
      return JadwalAbsenSiswa.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load instansi data');
    }
  }
}
