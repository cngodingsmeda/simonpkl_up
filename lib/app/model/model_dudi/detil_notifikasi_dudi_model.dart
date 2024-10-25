// To parse this JSON data, do
//
//     final detilNotifikasiDudiModel = detilNotifikasiDudiModelFromJson(jsonString);

import 'dart:convert';

DetilNotifikasiDudiModel detilNotifikasiDudiModelFromJson(String str) => DetilNotifikasiDudiModel.fromJson(json.decode(str));

String detilNotifikasiDudiModelToJson(DetilNotifikasiDudiModel data) => json.encode(data.toJson());

class DetilNotifikasiDudiModel {
    String? msg;
    DetilNotifikasiDudiModelData? data;

    DetilNotifikasiDudiModel({
        this.msg,
        this.data,
    });

    factory DetilNotifikasiDudiModel.fromJson(Map<String, dynamic> json) => DetilNotifikasiDudiModel(
        msg: json["msg"],
        data: json["data"] == null ? null : DetilNotifikasiDudiModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data?.toJson(),
    };
}

class DetilNotifikasiDudiModelData {
    int? id;
    String? title;
    String? body;
    DateTime? createdAt;
    List<dynamic>? reads;
    DataData? data;

    DetilNotifikasiDudiModelData({
        this.id,
        this.title,
        this.body,
        this.createdAt,
        this.reads,
        this.data,
    });

    factory DetilNotifikasiDudiModelData.fromJson(Map<String, dynamic> json) => DetilNotifikasiDudiModelData(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        reads: json["reads"] == null ? [] : List<dynamic>.from(json["reads"]!.map((x) => x)),
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "created_at": createdAt?.toIso8601String(),
        "reads": reads == null ? [] : List<dynamic>.from(reads!.map((x) => x)),
        "data": data?.toJson(),
    };
}

class DataData {
    int? idNotification;
    String? dataType;
    int? dataId;

    DataData({
        this.idNotification,
        this.dataType,
        this.dataId,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        idNotification: json["id_notification"],
        dataType: json["data_type"],
        dataId: json["data_id"],
    );

    Map<String, dynamic> toJson() => {
        "id_notification": idNotification,
        "data_type": dataType,
        "data_id": dataId,
    };
}
