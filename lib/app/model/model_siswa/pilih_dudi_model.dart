// To parse this JSON data, do
//
//     final pilihDudiModel = pilihDudiModelFromJson(jsonString);

import 'dart:convert';

PilihDudiModel pilihDudiModelFromJson(String str) => PilihDudiModel.fromJson(json.decode(str));

String pilihDudiModelToJson(PilihDudiModel data) => json.encode(data.toJson());

class PilihDudiModel {
    int countData;
    int countPage;
    List<Datum> data;

    PilihDudiModel({
        required this.countData,
        required this.countPage,
        required this.data,
    });

    factory PilihDudiModel.fromJson(Map<String, dynamic> json) => PilihDudiModel(
        countData: json["count_data"],
        countPage: json["count_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count_data": countData,
        "count_page": countPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String namaInstansiPerusahaan;
    String bidangUsaha;
    String noTelepon;
    String deskripsi;
    bool tersedia;
    int idSekolah;
    int idTahun;
    Alamat alamat;
    int jumlahKuotaPria;
    int jumlahSiswaPria;
    int jumlahKuotaWanita;
    int jumlahSiswaWanita;
    List<KuotaJurusan> kuotaJurusan;

    Datum({
        required this.id,
        required this.namaInstansiPerusahaan,
        required this.bidangUsaha,
        required this.noTelepon,
        required this.deskripsi,
        required this.tersedia,
        required this.idSekolah,
        required this.idTahun,
        required this.alamat,
        required this.jumlahKuotaPria,
        required this.jumlahSiswaPria,
        required this.jumlahKuotaWanita,
        required this.jumlahSiswaWanita,
        required this.kuotaJurusan,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        namaInstansiPerusahaan: json["nama_instansi_perusahaan"],
        bidangUsaha: json["bidang_usaha"],
        noTelepon: json["no_telepon"],
        deskripsi: json["deskripsi"],
        tersedia: json["tersedia"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
        alamat: Alamat.fromJson(json["alamat"]),
        jumlahKuotaPria: json["jumlah_kuota_pria"],
        jumlahSiswaPria: json["jumlah_siswa_pria"],
        jumlahKuotaWanita: json["jumlah_kuota_wanita"],
        jumlahSiswaWanita: json["jumlah_siswa_wanita"],
        kuotaJurusan: List<KuotaJurusan>.from(json["kuota_jurusan"].map((x) => KuotaJurusan.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_instansi_perusahaan": namaInstansiPerusahaan,
        "bidang_usaha": bidangUsaha,
        "no_telepon": noTelepon,
        "deskripsi": deskripsi,
        "tersedia": tersedia,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
        "alamat": alamat.toJson(),
        "jumlah_kuota_pria": jumlahKuotaPria,
        "jumlah_siswa_pria": jumlahSiswaPria,
        "jumlah_kuota_wanita": jumlahKuotaWanita,
        "jumlah_siswa_wanita": jumlahSiswaWanita,
        "kuota_jurusan": List<dynamic>.from(kuotaJurusan.map((x) => x.toJson())),
    };
}

class Alamat {
    String detailTempat;
    String desa;
    String kecamatan;
    String kabupaten;
    String provinsi;
    String negara;

    Alamat({
        required this.detailTempat,
        required this.desa,
        required this.kecamatan,
        required this.kabupaten,
        required this.provinsi,
        required this.negara,
    });

    factory Alamat.fromJson(Map<String, dynamic> json) => Alamat(
        detailTempat: json["detail_tempat"],
        desa: json["desa"],
        kecamatan: json["kecamatan"],
        kabupaten: json["kabupaten"],
        provinsi: json["provinsi"],
        negara: json["negara"],
    );

    Map<String, dynamic> toJson() => {
        "detail_tempat": detailTempat,
        "desa": desa,
        "kecamatan": kecamatan,
        "kabupaten": kabupaten,
        "provinsi": provinsi,
        "negara": negara,
    };
}

class KuotaJurusan {
    String jurusan;
    int kuotaPria;
    int jumlahSiswaPria;
    int kuotaWanita;
    int jumlahSiswaWanita;

    KuotaJurusan({
        required this.jurusan,
        required this.kuotaPria,
        required this.jumlahSiswaPria,
        required this.kuotaWanita,
        required this.jumlahSiswaWanita,
    });

    factory KuotaJurusan.fromJson(Map<String, dynamic> json) => KuotaJurusan(
        jurusan: json["jurusan"],
        kuotaPria: json["kuota_pria"],
        jumlahSiswaPria: json["jumlah_siswa_pria"],
        kuotaWanita: json["kuota_wanita"],
        jumlahSiswaWanita: json["jumlah_siswa_wanita"],
    );

    Map<String, dynamic> toJson() => {
        "jurusan": jurusan,
        "kuota_pria": kuotaPria,
        "jumlah_siswa_pria": jumlahSiswaPria,
        "kuota_wanita": kuotaWanita,
        "jumlah_siswa_wanita": jumlahSiswaWanita,
    };
}
