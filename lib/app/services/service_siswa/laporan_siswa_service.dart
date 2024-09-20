// service/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_siswa_model.dart';

class HistoriAbsenSiswaService {
  static Future<List<HistoriAbsenSiswa>> fetchHistoriAbsenSiswa(int? month) async {
    final response = await http.get(Uri.parse(ApiUrl.urlGetAllHistoriAbsenSiswa));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => HistoriAbsenSiswa.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load historiAbsen');
    }
  }
}
