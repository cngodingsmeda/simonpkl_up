import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/data/api_url.dart';
import 'dart:convert';

import 'package:simon_pkl/app/model/model_siswa/ajuan_siswa_model.dart';

class AjuanSiswaService {

  Future<AjuanSiswa> getAjuanData() async {
    final response = await http.get(Uri.parse(ApiUrl.urlGetAllDudiSiswa));

    if (response.statusCode == 200) {
      return AjuanSiswa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
