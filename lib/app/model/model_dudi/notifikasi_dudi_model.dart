import 'dart:convert';

AllNotifikasiDudiModel allNotifikasiModelFromJson(String str) => AllNotifikasiDudiModel.fromJson(json.decode(str));

String allNotifikasiModelToJson(AllNotifikasiDudiModel data) => json.encode(data.toJson());

class AllNotifikasiDudiModel {
  Map<String, List<Notifikasi>> data;

  AllNotifikasiDudiModel({
    required this.data,
  });

  factory AllNotifikasiDudiModel.fromJson(Map<String, dynamic> json) => AllNotifikasiDudiModel(
        data: (json["data"] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            List<Notifikasi>.from(value.map((x) => Notifikasi.fromJson(x))),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
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
        reads: List<dynamic>.from(json["reads"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "created_at": createdAt.toIso8601String(),
        "reads": List<dynamic>.from(reads),
      };
}
