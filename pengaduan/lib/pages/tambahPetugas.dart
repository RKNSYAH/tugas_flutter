import 'package:aplikasi_pelaporan/components/inputValue.dart';
import 'package:aplikasi_pelaporan/controllers/petugasController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahPetugas extends StatelessWidget {
  const TambahPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    final petugasController = Get.put(PetugasController());
    RxMap mapValue = {}.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah petugas'),
      ),
      body: Column(
        children: [
          InputValue(
            label: "nama",
            onSubmitted: (value) => mapValue["nama_petugas"] = value,
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
              if (mapValue["nama_petugas"] == null) {
                Get.snackbar("Data kosong", "Nama masih kosong");
              } else if (mapValue["username"] == null) {
                Get.snackbar("Data kosong", "Username masih kosong");
              } else if (mapValue["password"] == null) {
                Get.snackbar("Data kosong", "Password masih kosong");
              } else if (mapValue["telp"] == null) {
                Get.snackbar("Data kosong", "Telp masih kosong");
              } else {
                petugasController.postPetugas(mapValue).then((value) {
                  if (value.statusCode == 200) {
                    Get.snackbar("Status", "Data berhasil ditambah");
                  } else {
                    print(value.body);
                    Get.snackbar("Status", "Data gagal ditambah");
                  }
                }).then((value) => petugasController.getPetugas());
              }
            },
            child: Text("Tambah Petugas"),
          )
        ],
      ),
    );
  }
}
