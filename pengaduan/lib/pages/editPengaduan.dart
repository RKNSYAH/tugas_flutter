import 'package:aplikasi_pelaporan/controllers/pengaduanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/inputValue.dart';

class EditPengaduan extends StatelessWidget {
  const EditPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    final pengaduanController = Get.put(PengaduanController());
    final data = pengaduanController.list;
    var index = Get.arguments;
    RxMap mapValue = {}.obs;

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit petugas'),
        ),
        body: Column(
          children: [
            Obx(
              () => pengaduanController.chosen.value
                  ? InkWell(
                      child: Image.memory(
                        pengaduanController.imagePicked!.bytes!,
                        width: 200,
                        height: 200,
                      ),
                      onTap: () {
                        pengaduanController.pickImage();
                        pengaduanController.web.value = true;
                      },
                    )
                  : InkWell(
                      child: Image.network(
                        data[index].url,
                        height: 150,
                        width: 150,
                      ),
                      onTap: () {
                        pengaduanController.pickImage();
                        pengaduanController.web.value = true;
                      },
                    ),
            ),
            InputValue(
              label: "isi_laporan",
              initval: data[index].isiLaporan,
              onSubmitted: (value) => mapValue["isi_laporan"] = value,
            ),
            InputValue(
              label: "status",
              initval: data[index].status,
              onSubmitted: (value) => mapValue["status"] = value,
            ),
            ElevatedButton(
                onPressed: () {
                  pengaduanController
                      .updatePengaduan(data[index].idPengaduan, mapValue)
                      .then((value) {
                    if (value.statusCode == 200) {
                      Get.snackbar("Status",
                          "Data ${data[index].idPengaduan} berhasil di update");
                    }
                  }).then((value) => pengaduanController.getPengaduan());
                },
                child: Text("Update data"))
          ],
        ));
  }
}
