class PilihanAbsenSiswa {
  final double latitude;
  final double longitude;
  final String jenisAbsen;

  PilihanAbsenSiswa({required this.latitude, required this.longitude, required this.jenisAbsen});

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
    'jenisAbsen': jenisAbsen,
  };
}
