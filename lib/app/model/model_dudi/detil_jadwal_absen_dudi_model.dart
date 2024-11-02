// To parse this JSON data, do
//
//     final detilJadwalAbsenSiswaDudiModel = detilJadwalAbsenSiswaDudiModelFromJson(jsonString);

import 'dart:convert';

DetilJadwalAbsenSiswaDudiModel detilJadwalAbsenSiswaDudiModelFromJson(String str) => DetilJadwalAbsenSiswaDudiModel.fromJson(json.decode(str));

String detilJadwalAbsenSiswaDudiModelToJson(DetilJadwalAbsenSiswaDudiModel data) => json.encode(data.toJson());

class DetilJadwalAbsenSiswaDudiModel {
    String? msg;
    Data? data;

    DetilJadwalAbsenSiswaDudiModel({
        this.msg,
        this.data,
    });

    factory DetilJadwalAbsenSiswaDudiModel.fromJson(Map<String, dynamic> json) => DetilJadwalAbsenSiswaDudiModel(
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? hari;
    String? batasAbsenMasuk;
    int? minJamKerja;
    String? batasAbsenPulang;
    bool? enable;
    Dudi? dudi;

    Data({
        this.id,
        this.hari,
        this.batasAbsenMasuk,
        this.batasAbsenPulang,
        this.minJamKerja,
        this.enable,
        this.dudi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        hari: json["hari"],
        batasAbsenMasuk: json["batas_absen_masuk"],
        batasAbsenPulang: json["batas_absen_pulang"],
        minJamKerja: json["min_jam_kerja"],
        enable: json["enable"],
        dudi: json["dudi"] == null ? null : Dudi.fromJson(json["dudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hari": hari,
        "batas_absen_masuk": batasAbsenMasuk,
        "batas_absen_pulang": batasAbsenPulang,
        "min_jam_kerja": minJamKerja,
        "enable": enable,
        "dudi": dudi?.toJson(),
    };
}

class Dudi {
    int? id;
    String? namaInstansiPerusahaan;
    String? bidangUsaha;
    String? noTelepon;
    String? deskripsi;
    bool? tersedia;
    int? idSekolah;
    int? idTahun;

    Dudi({
        this.id,
        this.namaInstansiPerusahaan,
        this.bidangUsaha,
        this.noTelepon,
        this.deskripsi,
        this.tersedia,
        this.idSekolah,
        this.idTahun,
    });

    factory Dudi.fromJson(Map<String, dynamic> json) => Dudi(
        id: json["id"],
        namaInstansiPerusahaan: json["nama_instansi_perusahaan"],
        bidangUsaha: json["bidang_usaha"],
        noTelepon: json["no_telepon"],
        deskripsi: json["deskripsi"],
        tersedia: json["tersedia"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
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
    };
}
