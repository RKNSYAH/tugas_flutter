import 'package:daftarmapel/homecontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditKelas extends StatelessWidget {
  const EditKelas({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControl homecontrol = Get.put(HomeControl());
    return Scaffold(
      appBar: AppBar(
          title: Text("Edit Nama Kelas"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    width: 100,
                    height: 150,
                    color: Colors.orange,
                    padding: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/kelas");
                          },
                          child: Text("Edit Kelas"),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/list");
                          },
                          child: Text("Tambah Siswa"),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/map");
                          },
                          child: Text("Tambah Mapel"),
                        ),
                      ],
                    ),
                  ));
                },
                icon: Icon(Icons.edit))
          ],
        ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: homecontrol.namakelas,
              decoration: InputDecoration(label: Text("Input Nama")),
            ),
            ElevatedButton(
                onPressed: () {
                  homecontrol.editKelas(homecontrol.namakelas.text);
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
