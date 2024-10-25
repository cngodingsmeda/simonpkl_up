// To parse this JSON data, do
//
//     final detilDataSiswaDudiModel = detilDataSiswaDudiModelFromJson(jsonString);

import 'dart:convert';

DetilDataSiswaDudiModel detilDataSiswaDudiModelFromJson(String str) => DetilDataSiswaDudiModel.fromJson(json.decode(str));

String detilDataSiswaDudiModelToJson(DetilDataSiswaDudiModel data) => json.encode(data.toJson());

class DetilDataSiswaDudiModel {
    Data? data;

    DetilDataSiswaDudiModel({
        this.data,
    });

    factory DetilDataSiswaDudiModel.fromJson(Map<String, dynamic> json) => DetilDataSiswaDudiModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? nis;
    String? nama;
    String? jenisKelamin;
    String? email;
    String? noTelepon;
    String? status;
    dynamic tokenFcm;
    String? fotoProfile;
    Alamat? alamat;
    Jurusan? jurusan;
    Kelas? kelas;
    GuruPembimbing? guruPembimbing;

    Data({
        this.id,
        this.nis,
        this.nama,
        this.jenisKelamin,
        this.email,
        this.noTelepon,
        this.status,
        this.tokenFcm,
        this.fotoProfile,
        this.alamat,
        this.jurusan,
        this.kelas,
        this.guruPembimbing,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nis: json["nis"],
        nama: json["nama"],
        jenisKelamin: json["jenis_kelamin"],
        email: json["email"],
        noTelepon: json["no_telepon"],
        status: json["status"],
        tokenFcm: json["token_FCM"],
        fotoProfile: json["foto_profile"],
        alamat: json["alamat"] == null ? null : Alamat.fromJson(json["alamat"]),
        jurusan: json["jurusan"] == null ? null : Jurusan.fromJson(json["jurusan"]),
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
        guruPembimbing: json["guru_pembimbing"] == null ? null : GuruPembimbing.fromJson(json["guru_pembimbing"]),
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
        "alamat": alamat?.toJson(),
        "jurusan": jurusan?.toJson(),
        "kelas": kelas?.toJson(),
        "guru_pembimbing": guruPembimbing?.toJson(),
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
        "negara": negara,
    };
}

class GuruPembimbing {
    int? id;
    String? nip;
    String? nama;
    String? noTelepon;
    String? email;
    String? jenisKelamin;
    String? tempatLahir;
    DateTime? tanggalLahir;
    String? agama;
    dynamic fotoProfile;
    dynamic tokenFcm;
    int? idSekolah;
    int? idTahun;

    GuruPembimbing({
        this.id,
        this.nip,
        this.nama,
        this.noTelepon,
        this.email,
        this.jenisKelamin,
        this.tempatLahir,
        this.tanggalLahir,
        this.agama,
        this.fotoProfile,
        this.tokenFcm,
        this.idSekolah,
        this.idTahun,
    });

    factory GuruPembimbing.fromJson(Map<String, dynamic> json) => GuruPembimbing(
        id: json["id"],
        nip: json["nip"],
        nama: json["nama"],
        noTelepon: json["no_telepon"],
        email: json["email"],
        jenisKelamin: json["jenis_kelamin"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"] == null ? null : DateTime.parse(json["tanggal_lahir"]),
        agama: json["agama"],
        fotoProfile: json["foto_profile"],
        tokenFcm: json["token_FCM"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "nama": nama,
        "no_telepon": noTelepon,
        "email": email,
        "jenis_kelamin": jenisKelamin,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "agama": agama,
        "foto_profile": fotoProfile,
        "token_FCM": tokenFcm,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
    };
}

class Jurusan {
    int? id;
    String? nama;
    int? idSekolah;
    int? idTahun;

    Jurusan({
        this.id,
        this.nama,
        this.idSekolah,
        this.idTahun,
    });

    factory Jurusan.fromJson(Map<String, dynamic> json) => Jurusan(
        id: json["id"],
        nama: json["nama"],
        idSekolah: json["id_sekolah"],
        idTahun: json["id_tahun"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_sekolah": idSekolah,
        "id_tahun": idTahun,
    };
}

class Kelas {
    int? id;
    String? nama;
    String? tahun;
    int? idJurusan;

    Kelas({
        this.id,
        this.nama,
        this.tahun,
        this.idJurusan,
    });

    factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        nama: json["nama"],
        tahun: json["tahun"],
        idJurusan: json["id_jurusan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "tahun": tahun,
        "id_jurusan": idJurusan,
    };
}
