// model/HistoriAbsenSiswa.dart
import 'package:flutter/material.dart';

class HistoriAbsenSiswa {
  final String tanggal;
  final String status;
  final IconData icon;
  final Color color;

  HistoriAbsenSiswa({
    required this.tanggal,
    required this.status,
    required this.icon,
    required this.color,
  });

  factory HistoriAbsenSiswa.fromJson(Map<String, dynamic> json) {
    return HistoriAbsenSiswa(
      tanggal: json['tanggal'],
      status: json['status'],
      icon: _iconFromString(json['status']),
      color: _colorFromString(json['status']),
    );
  }

  static IconData _iconFromString(String status) {
    switch (status.toLowerCase()) {
      case 'hadir':
        return Icons.check_circle;
      case 'sakit':
        return Icons.error;
      case 'izin' || 'telat':
        return Icons.help;
      default:
        return Icons.help;
    }
  }

  static Color _colorFromString(String status) {
    switch (status.toLowerCase()) {
      case 'sakit':
        return Colors.red;
      case 'hadir':
        return Colors.green;
      case 'izin' || 'telat':
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }
}
