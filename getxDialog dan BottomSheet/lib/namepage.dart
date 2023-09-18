import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamePage extends StatelessWidget {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var dataNama = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Nama Pengguna"),
      ),
      body: Center(child: Text(dataNama)),
    );
  }
}
