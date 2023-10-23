import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/inputValue.dart';

class EditMasyarakat extends StatelessWidget {
  const EditMasyarakat({super.key});

  @override
  Widget build(BuildContext context) {
    final masyarakatController = Get.put(MasyarakatController());
    RxMap mapValue = {}.obs;
    final data = masyarakatController.list;
    var index = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit masyarakat'),
        ),
        body: Column(
          children: [
            InputValue(
              label: "nama",
              onSubmitted: (value) => mapValue["nama"] = value,
            ),
            InputValue(
              label: "username",
              onSubmitted: (value) => mapValue["username"] = value,
            ),
            InputValue(
              label: "password",
              onSubmitted: (value) => mapValue["password"] = value,
            ),
            InputValue(
              label: "telp",
              onSubmitted: (value) => mapValue["telp"] = value,
            ),
            ElevatedButton(
                onPressed: () {
                  masyarakatController
                      .updateMasyarakat(data[index].nik, mapValue)
                      .then((value) {
                    if (value.statusCode == 200) {
                      Get.snackbar("Status",
                          "Data ${data[index].nik} berhasil di update");
                    } else {
                      Get.snackbar("Status",
                          "Data ${data[index].nik} gagal di update");
                    }
                  }).then((value) => masyarakatController.getMasyarakat());
                },
                child: Text("Update data"))
          ],
        ));
  }
}
