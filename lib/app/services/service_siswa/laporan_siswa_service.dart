// service/api_service.dart
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_siswa_model.dart';
import 'dart:convert';

class LaporanSiswaService {
  static Future<List<LaporanSiswa>> fetchLaporanSiswa(int? month) async {
    final response = await http.get(Uri.parse(ApiUrl.urlGetAllLaporanSiswa));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => LaporanSiswa.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load laporan');
    }
  }
}
