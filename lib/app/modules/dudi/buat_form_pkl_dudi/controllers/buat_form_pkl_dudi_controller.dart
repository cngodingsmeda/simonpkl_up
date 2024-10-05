import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuatFormPklDudiController extends GetxController {
  // Daftar hari untuk jadwal
  List<String> hariList = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
  ];

  // List Dropdown untuk Topik/Jurusan
  final List<String> jurusanList = [
    "Tidak Ada Kriteria Jurusan",
    "Akuntansi & Keuangan Lembaga",
    "Bisnis Digital",
    "Bisnis Retail",
    "Layanan Perbankan Syariah",
    "Manajemen Perkantoran",
    "Rekayasa Perangkat Lunak",
    "Teknik Komputer & Jaringan",
    "Usaha Layanan Wisata",
  ];

  // Variabel observables
  var selectedTopik = ''.obs; // Jurusan/Topik yang dipilih
  var jamMasukAwal = TimeOfDay.now().obs; // Jam Masuk Awal
  var jamMasukAkhir = TimeOfDay.now().obs; // Jam Masuk Akhir
  var jamPulangAwal = TimeOfDay.now().obs; // Jam Pulang Awal
  var jamPulangAkhir = TimeOfDay.now().obs; // Jam Pulang Akhir
  var jumlahLakiLaki = 0.obs; // Jumlah siswa laki-laki
  var jumlahPerempuan = 0.obs; // Jumlah siswa perempuan
  var selectedLocation = "".obs; // Lokasi absen yang dipilih
  var jumlahFormJadwal = 1.obs; // Jumlah form jadwal yang ditampilkan
  var selectedHariList = <String>[].obs; // Hari yang dipilih dalam jadwal
  var selectedJurusanList = <String>[].obs; // Jurusan yang dipilih
  var jamMasukList = <TimeOfDay>[].obs; // List waktu masuk untuk tiap hari
  var jamPulangList = <TimeOfDay>[].obs; // List waktu pulang untuk tiap hari

  // Fungsi untuk memilih lokasi
  void pickLocation() {
    selectedLocation.value = "Lokasi Terpilih";
  }

  // Fungsi untuk menambah form jadwal
  void addNewDay() {
    if (jumlahFormJadwal.value < hariList.length) {
      jumlahFormJadwal.value += 1;
      addTimePickersForNewDay();
      print("daftar hari: $selectedHariList");
    }
  }

  // Fungsi untuk mendapatkan jumlah jurusan yang dipilih
  int get jumlahJurusan => selectedJurusanList.length;

  // Fungsi untuk menambah jam masuk/pulang ke list
  void addTimePickersForNewDay() {
    if (jamMasukList.length < jumlahFormJadwal.value) {
      jamMasukList.add(TimeOfDay.now());
      jamPulangList.add(TimeOfDay.now());
      print("List Masuk: $jamMasukList");
      print("List Pulang: $jamPulangList");
      print("Jam Masuk : $jamMasukAwal - $jamMasukAkhir");
      print("Jam Pulang : $jamPulangAwal - $jamPulangAkhir");
    }
  }

  // Fungsi untuk memilih jurusan
  void selectJurusan(String jurusan) {
    if (!selectedJurusanList.contains(jurusan)) {
      selectedJurusanList.add(jurusan);
    }
  }

  // Fungsi untuk memilih hari
  void selectHari(String hari) {
    if (!selectedHariList.contains(hari)) {
      selectedHariList.add(hari);
    }
  }

  // Fungsi untuk mereset form
  void resetForm() {
    selectedTopik.value = '';
    selectedJurusanList.clear();
    selectedHariList.clear();
    jamMasukList.clear();
    jamPulangList.clear();
    jumlahLakiLaki.value = 0;
    jumlahPerempuan.value = 0;
    jumlahFormJadwal.value = 1;
  }
}
