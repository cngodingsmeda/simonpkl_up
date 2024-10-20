// To parse this JSON data, do
//
//     final detilKendalaDudiGuruModel = detilKendalaDudiGuruModelFromJson(jsonString);

import 'dart:convert';

DetilKendalaDudiGuruModel detilKendalaDudiGuruModelFromJson(String str) => DetilKendalaDudiGuruModel.fromJson(json.decode(str));

String detilKendalaDudiGuruModelToJson(DetilKendalaDudiGuruModel data) => json.encode(data.toJson());

class DetilKendalaDudiGuruModel {
    Data? data;

    DetilKendalaDudiGuruModel({
        this.data,
    });

    factory DetilKendalaDudiGuruModel.fromJson(Map<String, dynamic> json) => DetilKendalaDudiGuruModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? idSiswa;
    int? idPembimbingDudi;
    DateTime? tanggal;
    String? kendala;
    dynamic fileLaporan;
    String? deskripsi;
    Siswa? siswa;
    PembimbingDudi? pembimbingDudi;

    Data({
        this.id,
        this.idSiswa,
        this.idPembimbingDudi,
        this.tanggal,
        this.kendala,
        this.fileLaporan,
        this.deskripsi,
        this.siswa,
        this.pembimbingDudi,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        idSiswa: json["id_siswa"],
        idPembimbingDudi: json["id_pembimbing_dudi"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        kendala: json["kendala"],
        fileLaporan: json["file_laporan"],
        deskripsi: json["deskripsi"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
        pembimbingDudi: json["pembimbingDudi"] == null ? null : PembimbingDudi.fromJson(json["pembimbingDudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_siswa": idSiswa,
        "id_pembimbing_dudi": idPembimbingDudi,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "kendala": kendala,
        "file_laporan": fileLaporan,
        "deskripsi": deskripsi,
        "siswa": siswa?.toJson(),
        "pembimbingDudi": pembimbingDudi?.toJson(),
    };
}

class PembimbingDudi {
    int? id;
    String? username;
    String? nama;
    String? noTelepon;
    String? email;
    dynamic fotoProfile;
    String? jenisKelamin;
    dynamic tokenFcm;
    int? idDudi;
    int? idSekolah;
    int? idTahun;

    PembimbingDudi({
        this.id,
        this.username,
        this.nama,
        this.noTelepon,
        this.email,
        this.fotoProfile,
        this.jenisKelamin,
        this.tokenFcm,
        this.idDudi,
        this.idSekolah,
        this.idTahun,
    });

    factory PembimbingDudi.fromJson(Map<String, dynamic> json) => PembimbingDudi(
        id: json["id"],
        username: json["username"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        fotoProfile: json["foto_profile"],
        jenisKelamin: json["jenis_kelamin"],
        tokenFcm: json["token_FCM"],
        idDudi: json["id_dudi"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama": nama,
        "no_telepon": noTelepon,
        "email": email,
        "foto_profile": fotoProfile,
        "jenis_kelamin": jenisKelamin,
        "token_FCM": tokenFcm,
        "id_dudi": idDudi,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
    };
}

class Siswa {
    int? id;
    String? nis;
    String? nama;
    String? jenisKelamin;
    String? email;
    String? noTelepon;
    String? status;
    dynamic tokenFcm;
    dynamic fotoProfile;
    Dudi? dudi;

    Siswa({
        this.id,
        this.nis,
        this.nama,
        this.jenisKelamin,
        this.email,
        this.noTelepon,
        this.status,
        this.tokenFcm,
        this.fotoProfile,
        this.dudi,
    });

    factory Siswa.fromJson(Map<String, dynamic> json) => Siswa(
        id: json["id"],
        nis: json["nis"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        status: json["status"],
        tokenFcm: json["token_FCM"],
        fotoProfile: json["foto_profile"],
        dudi: json["dudi"] == null ? null : Dudi.fromJson(json["dudi"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nis": nis,
        "nama": nama,
        "jenis_kelamin": jenisKelamin,
        "email": email,
        "no_telepon": noTelepon,
        "status": status,
        "token_FCM": tokenFcm,
        "foto_profile": fotoProfile,
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
