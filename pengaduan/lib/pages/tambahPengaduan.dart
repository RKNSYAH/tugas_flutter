import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/inputValue.dart';

class TambahPengaduan extends StatelessWidget {
  const TambahPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    final pengaduanControl = Get.put(PengaduanController());
    RxMap mapValue = {}.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah pengaduan'),
      ),
      body: Column(
        children: [
          Obx(
            () => pengaduanControl.chosen.value
                ? Image.memory(
                    pengaduanControl.imagePicked!.bytes!,
                    width: 200,
                    height: 200,
                  )
                : SizedBox(),
          ),
          pengaduanControl.isWeb.value
              ? ElevatedButton(
                  onPressed: () {
                    pengaduanControl.pickImage();
                    pengaduanControl.web.value = true;
                  },
                  child: Text("Pick Image"))
              : ElevatedButton(
                  onPressed: () {
                    pengaduanControl.pickImage();
                    print('mobile');
                  },
                  child: Text("Pick Image Mobile")),
          InputValue(
            label: "nik",
            onSubmitted: (value) => mapValue["nik"] = value,
          ),
          InputValue(
            label: "isi_laporan",
            onSubmitted: (value) => mapValue["isi_laporan"] = value,
          ),
          InputValue(
            label: "status",
            onSubmitted: (value) => mapValue["status"] = value,
          ),
          ElevatedButton(
            onPressed: () {
              if (mapValue["nik"] == null) {
                Get.snackbar("Data kosong", "NIK masih kosong");
              } else if (mapValue["isi_laporan"] == null) {
                Get.snackbar("Data kosong", "Isi Laporan masih kosong");
              } else if (mapValue["status"] == null) {
                Get.snackbar("Data kosong", "Status masih kosong");
              } else {
                pengaduanControl.postPengaduan(mapValue).then((value) {
                  if (value.statusCode == 200) {
                    Get.snackbar("Status", "Data berhasil ditambah");
                  } else {
                    print(value);
                    Get.snackbar("Status", "Data gagal ditambah");
                  }
                }).then((value) => pengaduanControl.getPengaduan());
              }
            },
            child: Text("Tambah Pengaduan"),
          )
        ],
      ),
    );
  }
}
