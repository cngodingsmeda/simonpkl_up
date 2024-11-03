// To parse this JSON data, do
//
//     final pilihAllDudiModel = pilihAllDudiModelFromJson(jsonString);

import 'dart:convert';

PilihAllDudiModel pilihAllDudiModelFromJson(String str) => PilihAllDudiModel.fromJson(json.decode(str));

String pilihAllDudiModelToJson(PilihAllDudiModel data) => json.encode(data.toJson());

class PilihAllDudiModel {
    String? msg;
    List<DatumDudi>? data;

    PilihAllDudiModel({
        this.msg,
        this.data,
    });

    factory PilihAllDudiModel.fromJson(Map<String, dynamic> json) => PilihAllDudiModel(
        msg: json["msg"],
        data: json["data"] == null ? [] : List<DatumDudi>.from(json["data"]!.map((x) => DatumDudi.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class DatumDudi {
    int? id;
    String? namaInstansiPerusahaan;
    String? bidangUsaha;
    String? noTelepon;
    String? deskripsi;
    bool? tersedia;
    int? idSekolah;
    int? idTahun;
    Alamat? alamat;
    int? jumlahKuotaPria;
    int? jumlahSiswaPria;
    int? jumlahKuotaWanita;
    int? jumlahSiswaWanita;
    List<KuotaJurusan>? kuotaJurusan;

    DatumDudi({
        this.id,
        this.namaInstansiPerusahaan,
        this.bidangUsaha,
        this.noTelepon,
        this.deskripsi,
        this.tersedia,
        this.idSekolah,
        this.idTahun,
        this.alamat,
        this.jumlahKuotaPria,
        this.jumlahSiswaPria,
        this.jumlahKuotaWanita,
        this.jumlahSiswaWanita,
        this.kuotaJurusan,
    });

    factory DatumDudi.fromJson(Map<String, dynamic> json) => DatumDudi(
        id: json["id"],
        namaInstansiPerusahaan: json["nama_instansi_perusahaan"],
        bidangUsaha: json["bidang_usaha"],
        noTelepon: json["no_telepon"],
        deskripsi: json["deskripsi"],
        tersedia: json["tersedia"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        jumlahKuotaPria: json["jumlah_kuota_pria"],
        jumlahSiswaPria: json["jumlah_siswa_pria"],
        jumlahKuotaWanita: json["jumlah_kuota_wanita"],
        jumlahSiswaWanita: json["jumlah_siswa_wanita"],
        kuotaJurusan: json["kuota_jurusan"] == null ? [] : List<KuotaJurusan>.from(json["kuota_jurusan"]!.map((x) => KuotaJurusan.fromJson(x))),
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
        "alamat": alamat?.toJson(),
        "jumlah_kuota_pria": jumlahKuotaPria,
        "jumlah_siswa_pria": jumlahSiswaPria,
        "jumlah_kuota_wanita": jumlahKuotaWanita,
        "jumlah_siswa_wanita": jumlahSiswaWanita,
        "kuota_jurusan": kuotaJurusan == null ? [] : List<dynamic>.from(kuotaJurusan!.map((x) => x.toJson())),
    };
}

class Alamat {
    String? detailTempat;
    String? desa;
    String? kecamatan;
    String? kabupaten;
    String? provinsi;
    String? negara;

    Alamat({
        this.detailTempat,
        this.desa,
        this.kecamatan,
        this.kabupaten,
        this.provinsi,
        this.negara,
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
        "negara":negara,
    };
}

class KuotaJurusan {
    String? jurusan;
    int? kuotaPria;
    int? jumlahSiswaPria;
    int? kuotaWanita;
    int? jumlahSiswaWanita;

    KuotaJurusan({
        this.jurusan,
        this.kuotaPria,
        this.jumlahSiswaPria,
        this.kuotaWanita,
        this.jumlahSiswaWanita,
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
