import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'dart:convert';

import 'package:simon_pkl/app/model/model_siswa/notif_siswa_model.dart';

class NotifikasiSiswaService {

  Future<List<NotifikasiModel>> getNotifikasiData() async {
    final response = await http.get(Uri.parse(ApiUrl.urlGetAjuanSiswa));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => NotifikasiModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load notifikasi');
    }
  }
}
