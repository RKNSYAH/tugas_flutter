import 'package:daftarmapel/homecontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControl controlhome = Get.put(HomeControl());
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Mapel"),
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
        body: Obx(
          () => ListView(children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("${controlhome.namaKelas.value}")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Jumlah Siswa : ${controlhome.num.value}"),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (controlhome.isOpen.value)
                                  controlhome.IncreaseNum();
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                if (controlhome.isOpen.value)
                                  controlhome.decreaseNum();
                              },
                              icon: Icon(Icons.remove)),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controlhome.isOpen.value ? "Open" : "Closed",
                        style: TextStyle(
                            color: controlhome.isOpen.value
                                ? Colors.green
                                : Colors.red),
                      ),
                      Switch(
                          value: controlhome.isOpen.value,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            controlhome.setIsOpen(value);
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Nama Siswa")],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controlhome.daftarNama.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${controlhome.daftarNama[index]}'),
                        );
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Nama Kelas")],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controlhome.dataMapel.length,
                      itemBuilder: (context, index) {
                        String key =
                            controlhome.dataMapel.keys.elementAt(index);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(key),
                            Text('${controlhome.dataMapel[key]}'),
                          ],
                        );
                      }),
                ],
              ),
            ),
          ]),
        ));
  }
}
