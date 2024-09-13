// lib/app/services/dudi_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/pilih_dudi_model.dart';

class PilihDudiSiswaService {

  Future<List<PilihDudiModel>> fetchDudiList() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl.urlGetAllLaporanSiswa));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((data) => PilihDudiModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load DUDI data');
      }
    } catch (e) {
      throw Exception('Failed to load DUDI data: $e');
    }
  }
}
