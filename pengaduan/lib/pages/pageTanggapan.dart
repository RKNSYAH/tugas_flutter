import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:aplikasi_pelaporan/controllers/tanggapanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTanggapan extends StatelessWidget {
  const PageTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    final tanggapanControl = Get.put(TanggapanController());
    final data = tanggapanControl.list;
    RxMap mapValue = {}.obs;
    print('tes');
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
                          Text("Isi Tanggapan : " + data[index].tanggapan),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.toNamed("/editTanggapan", arguments: index);
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                tanggapanControl
                                    .deleteTanggapan(data[index].idTanggapan)
                                    .then((value) {
                                  Get.snackbar("Status",
                                      "Data dengan nik = ${data[index].idTanggapan} berhasil dihapus");
                                }).then((value) =>
                                        tanggapanControl.getTanggapan());
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
                        Get.toNamed("/tambahTanggapan");
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
