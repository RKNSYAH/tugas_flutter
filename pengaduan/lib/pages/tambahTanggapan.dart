import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:aplikasi_pelaporan/controllers/petugasController.dart';
import 'package:aplikasi_pelaporan/controllers/tanggapanController.dart';
import 'package:aplikasi_pelaporan/models/petugas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/inputValue.dart';

class TambahTanggapan extends StatelessWidget {
  const TambahTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    final tanggapanControl = Get.put(TanggapanController());
    final pengaduanControl = Get.put(PengaduanController());
    final petugasControl = Get.put(PetugasController());
    RxMap mapValue = {}.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah tanggapan'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          InputValue(
            label: "tanggapan",
            onSubmitted: (value) => mapValue["tanggapan"] = value,
          ),
          Obx(
            () => DropdownButtonFormField(
              value: null,
              elevation: 16,
              decoration: InputDecoration(
                hintText: 'Pilih Pengaduan',
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(color: Colors.yellow),
              ),
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (value) {
                mapValue['id_pengaduan'] = value;
              },
              items: pengaduanControl.list.map((value) {
                return DropdownMenuItem(
                  child: Text(value.isiLaporan),
                  value: value.idPengaduan,
                );
              }).toList(),
            ),
          ),
          Obx(
            () => DropdownButtonFormField(
              value: null,
              elevation: 16,
              decoration: InputDecoration(
                hintText: 'Pilih Petugas',
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(color: Colors.yellow),
              ),
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (value) {
                mapValue['id_petugas'] = value;
              },
              items: petugasControl.list.map((value) {
                return DropdownMenuItem(
                  child: Text(value.namaPetugas),
                  value: value.idPetugas,
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (mapValue["tanggapan"] == null) {
                Get.snackbar("Data kosong", "tanggapan masih kosong");
              } else {
                tanggapanControl.postTanggapan(mapValue).then((value) {
                  if (value.statusCode == 200) {
                    Get.snackbar("Status", "Data berhasil ditambah");
                  } else {
                    print(value);
                    Get.snackbar("Status", "Data gagal ditambah");
                  }
                }).then((value) => tanggapanControl.getTanggapan());
              }
            },
            child: Text("Tambah Pengaduan"),
          )
        ],
      ),
    );
  }
}
