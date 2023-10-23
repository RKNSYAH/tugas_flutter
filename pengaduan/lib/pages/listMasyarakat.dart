import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/inputValue.dart';

class ListMasyarakatScreen extends StatelessWidget {
  const ListMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final masyarakatController = Get.put(MasyarakatController());
    final data = masyarakatController.list;
    RxMap mapValue =
        {"nama": "", "username": "", "password": "", "telp": ""}.obs;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) => Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nama : " + data[index].nama),
                        Text("NIK : " + data[index].nik),
                        Text("Telp : " + data[index].telp),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed("/edit", arguments: index);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              masyarakatController
                                  .deleteMasyarakat(data[index].nik)
                                  .then((value) {
                                if (value.statusCode == 200) {
                                  Get.snackbar("Status",
                                      "Data dengan nik = ${data[index].nik} berhasil dihapus");
                                }
                              }).then((value) =>
                                      masyarakatController.getMasyarakat());
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/petugas");
                    },
                    child: const Text("Petugas")),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/tambah");
                    },
                    child: const Text("Tambah Data"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
