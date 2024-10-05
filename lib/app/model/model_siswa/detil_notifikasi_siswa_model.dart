// To parse this JSON data, do
//
//     final detilNotifikasiModel = detilNotifikasiModelFromJson(jsonString);

import 'dart:convert';

DetilNotifikasiModel detilNotifikasiModelFromJson(String str) => DetilNotifikasiModel.fromJson(json.decode(str));

String detilNotifikasiModelToJson(DetilNotifikasiModel data) => json.encode(data.toJson());

class DetilNotifikasiModel {
    int id;
    String title;
    String body;
    DateTime createdAt;
    List<Read> reads;

    DetilNotifikasiModel({
        required this.id,
        required this.title,
        required this.body,
        required this.createdAt,
        required this.reads,
    });

    factory DetilNotifikasiModel.fromJson(Map<String, dynamic> json) => DetilNotifikasiModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
        reads: List<Read>.from(json["reads"].map((x) => Read.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "created_at": createdAt.toIso8601String(),
        "reads": List<dynamic>.from(reads.map((x) => x.toJson())),
    };
}

class Read {
    int id;
    bool isRead;

    Read({
        required this.id,
        required this.isRead,
    });

    factory Read.fromJson(Map<String, dynamic> json) => Read(
        id: json["id"],
        isRead: json["is_read"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_read": isRead,
    };
}
