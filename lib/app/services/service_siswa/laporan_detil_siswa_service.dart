// service/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_detil_siswa_model.dart';

class HistoriAbsenDetilSiswaService {
  static Future<HistoriAbsenDetilSiswa> fetchHistoriAbsenDetailSiswa(String id) async {
    final response = await http.get(Uri.parse('${ApiUrl.urlGetHistoriAbsenDetil}/$id'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return HistoriAbsenDetilSiswa.fromJson(json);
    } else {
      throw Exception('Failed to load historiAbsen detail');
    }
  }
}
