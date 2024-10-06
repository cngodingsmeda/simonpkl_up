import 'dart:convert';

AllNotifikasiModel allNotifikasiModelFromJson(String str) => AllNotifikasiModel.fromJson(json.decode(str));

String allNotifikasiModelToJson(AllNotifikasiModel data) => json.encode(data.toJson());

class AllNotifikasiModel {
  String msg;
  Map<String, List<Notifikasi>> data;

  AllNotifikasiModel({
    required this.msg,
    required this.data,
  });

  factory AllNotifikasiModel.fromJson(Map<String, dynamic> json) => AllNotifikasiModel(
        msg: json["msg"],
        data: (json["data"] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            List<Notifikasi>.from(value.map((x) => Notifikasi.fromJson(x))),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data.map(
          (key, value) => MapEntry(
            key,
            List<dynamic>.from(value.map((x) => x.toJson())),
          ),
        ),
      };
}

class Notifikasi {
  int id;
  String title;
  String body;
  DateTime createdAt;
  List<dynamic> reads;

  Notifikasi({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.reads,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) => Notifikasi(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
        reads: List<dynamic>.from(json["reads"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "created_at": createdAt.toIso8601String(),
        "reads": List<dynamic>.from(reads.map((x) => x)),
      };
}
