import 'package:aplikasi_pelaporan/controllers/masyarakatController.dart';
import 'package:aplikasi_pelaporan/controllers/petugasController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPetugas extends StatelessWidget {
  const ListPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    final petugasController = Get.put(PetugasController());
    final data = petugasController.list;
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
                        Text("Nama : " + data[index].namaPetugas),
                        Text("NIK : " + data[index].telp),
                        Text("Level : " + data[index].level),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed("/editPetugas", arguments: index);
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              petugasController
                                  .deletePetugas(data[index].idPetugas)
                                  .then((value) {
                                Get.snackbar("Status",
                                    "Data dengan nik = ${data[index].idPetugas} berhasil dihapus");
                              }).then((value) =>
                                      petugasController.getPetugas());
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
                      Get.toNamed("/");
                    },
                    child: const Text("Masyarakat")),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/tambahPetugas");
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
