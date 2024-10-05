// To parse this JSON data, do
//
//     final allNotifikasiModel = allNotifikasiModelFromJson(jsonString);

import 'dart:convert';

AllNotifikasiModel allNotifikasiModelFromJson(String str) => AllNotifikasiModel.fromJson(json.decode(str));

String allNotifikasiModelToJson(AllNotifikasiModel data) => json.encode(data.toJson());

class AllNotifikasiModel {
    List<Datum> data;

    AllNotifikasiModel({
        required this.data,
    });

    factory AllNotifikasiModel.fromJson(Map<String, dynamic> json) => AllNotifikasiModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String title;
    String body;
    DateTime createdAt;
    List<Read> reads;

    Datum({
        required this.id,
        required this.title,
        required this.body,
        required this.createdAt,
        required this.reads,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
