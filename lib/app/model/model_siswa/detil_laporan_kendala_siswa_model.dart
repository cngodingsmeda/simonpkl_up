// To parse this JSON data, do
//
//     final detilLaporanKendalaSiswaModel = detilLaporanKendalaSiswaModelFromJson(jsonString);

import 'dart:convert';

DetilLaporanKendalaSiswaModel detilLaporanKendalaSiswaModelFromJson(String str) => DetilLaporanKendalaSiswaModel.fromJson(json.decode(str));

String detilLaporanKendalaSiswaModelToJson(DetilLaporanKendalaSiswaModel data) => json.encode(data.toJson());

class DetilLaporanKendalaSiswaModel {
    int? id;
    DateTime? tanggal;
    String? kendala;
    dynamic fileLaporan;
    String? deskripsi;
    Siswa? siswa;

    DetilLaporanKendalaSiswaModel({
        this.id,
        this.tanggal,
        this.kendala,
        this.fileLaporan,
        this.deskripsi,
        this.siswa,
    });

    factory DetilLaporanKendalaSiswaModel.fromJson(Map<String, dynamic> json) => DetilLaporanKendalaSiswaModel(
        id: json["id"],
        tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
        kendala: json["kendala"],
        fileLaporan: json["file_laporan"],
        deskripsi: json["deskripsi"],
        siswa: json["siswa"] == null ? null : Siswa.fromJson(json["siswa"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": "${tanggal!.year.toString().padLeft(4, '0')}-${tanggal!.month.toString().padLeft(2, '0')}-${tanggal!.day.toString().padLeft(2, '0')}",
        "kendala": kendala,
        "file_laporan": fileLaporan,
        "deskripsi": deskripsi,
        "siswa": siswa?.toJson(),
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
    String? fotoProfile;
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
