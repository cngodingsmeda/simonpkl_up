// service/api_service.dart
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'dart:convert';

import 'package:simon_pkl/app/model/model_siswa/laporan_detil_siswa_model.dart';

class LaporanDetilSiswaService {
  static Future<LaporanDetilSiswa> fetchLaporanDetailSiswa(String id) async {
    final response = await http.get(Uri.parse('${ApiUrl.urlGetLaporanDetil}/$id'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return LaporanDetilSiswa.fromJson(json);
    } else {
      throw Exception('Failed to load laporan detail');
    }
  }
}
