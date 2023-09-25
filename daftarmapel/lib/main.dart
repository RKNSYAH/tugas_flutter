import 'package:daftarmapel/homepage.dart';
import 'package:daftarmapel/kelaspage.dart';
import 'package:daftarmapel/listpage.dart';
import 'package:daftarmapel/mappage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(getPages: [
      GetPage(name: "/", page: () => MainApp()),
      GetPage(name: "/kelas", page: () => EditKelas()),
      GetPage(name: "/list", page: () => ListPage()),
      GetPage(name: "/map", page: () => MapPage()),
    ], home: HomePage());
  }
}
