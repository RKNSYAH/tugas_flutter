import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagePengaduan extends StatelessWidget {
  const PagePengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    final pengaduanControl = Get.put(PengaduanController());
    final data = pengaduanControl.list;
    RxMap mapValue = {}.obs;
    return Scaffold(
      body: ListView(children: [
        Column(
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
                          Image.network(
                            data[index].url,
                            height: 150,
                            width: 150,
                          ),
                          Text("Judul Pengaduan : " + data[index].isiLaporan),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed("/editPengaduan", arguments: index);
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                pengaduanControl
                                    .deletePengaduan(data[index].idPengaduan)
                                    .then((value) {
                                  Get.snackbar("Status",
                                      "Data dengan nik = ${data[index].idPengaduan} berhasil dihapus");
                                }).then((value) =>
                                        pengaduanControl.getPengaduan());
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
                        Get.toNamed("/tambahPengaduan");
                      },
                      child: const Text("Tambah Data"))
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
