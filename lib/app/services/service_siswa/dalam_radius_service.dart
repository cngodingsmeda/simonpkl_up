import 'dart:convert';

import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/pilihan_absen_siswa.dart';
import 'package:http/http.dart' as http;

class PilihanAbsenService {
  Future diDalamRadius<bool> (PilihanAbsenSiswa data) async {
    final response = await http.post(
      Uri.parse('${ApiUrl.urlGetStatusRadius}/check-location'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(data.toJson()),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['diDalamRadius'];
    } else {
      throw Exception('Failed to check location');
    }
  }
}
