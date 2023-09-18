import 'package:dialog/homepage.dart';
import 'package:dialog/indexpage.dart';
import 'package:dialog/listpage.dart';
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
      GetPage(name: "/index", page: () => IndexPage()),
      GetPage(name: "/list", page: () => ListPage()),
    ], home: HomePage());
  }
}
