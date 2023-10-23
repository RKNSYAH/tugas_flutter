import 'package:aplikasi_pelaporan/controllers/petugasController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/inputValue.dart';

class EditPetugas extends StatelessWidget {
  const EditPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    final petugasController = Get.put(PetugasController());
    RxMap mapValue = {}.obs;
    final data = petugasController.list;
    var index = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit petugas'),
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
                  petugasController
                      .updatePetugas(data[index].idPetugas, mapValue)
                      .then((value) {
                    if (value.statusCode == 200) {
                      Get.snackbar("Status",
                          "Data ${data[index].idPetugas} berhasil di update");
                    }
                  }).then((value) => petugasController.getPetugas());
                },
                child: Text("Update data"))
          ],
        ));
  }
}
