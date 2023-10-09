import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_api/screenDua.dart';
import 'package:latihan_api/screenSatu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: '/DataUser', getPages: [
      GetPage(name: '/DataUser', page: () => ScreenSatu()),
      GetPage(name: '/DataPost', page: () => ScreenDua()),
    ]);
  }
}
