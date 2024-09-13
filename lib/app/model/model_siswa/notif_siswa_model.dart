// model/notifikasi.dart
class NotifikasiModel {
  final String title;
  final String message;
  final String timestamp;
  final bool isRead;

  NotifikasiModel({
    required this.title,
    required this.message,
    required this.timestamp,
    required this.isRead,
  });

  factory NotifikasiModel.fromJson(Map<String, dynamic> json) {
    return NotifikasiModel(
      title: json['title'],
      message: json['message'],
      timestamp: json['timestamp'],
      isRead: json['isRead'],
    );
  }
}

