import 'package:dialog/homecontrol.dart';
import 'namepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControl controlhome = Get.put(HomeControl());
    return Scaffold(
        appBar: AppBar(
          title: Text("Default Dialog"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/index");
                          },
                          child: Text("To Index"),
                        ),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/list");
                          },
                          child: Text("To List"),
                        ),
                      ],
                    ),
                  ));
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: controlhome.fieldNama,
                decoration: InputDecoration(
                  labelText: "Nama",
                ),
                onSubmitted: (value) {
                  controlhome.changeValue(controlhome.fieldNama.text);
                  Get.snackbar("Variabel nama: ", controlhome.nama,
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 1));
                  // Get.defaultDialog(
                  //   title: "Nama",
                  //   middleText: controlhome.nama.value,
                  //   onConfirm: () {
                  // Get.to(NamePage(), arguments: controlhome.fieldNama.text);
                  //   },
                  // );
                },
              ),
              SizedBox(
                height: 25,
              ),
              GetBuilder<HomeControl>(builder: (hc) {
                return Text(hc.nama);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                        controlhome.isOpen.value ? "Open" : "Closed",
                        style: TextStyle(
                            color: controlhome.isOpen.value
                                ? Colors.green
                                : Colors.red),
                      )),
                  Obx(() => Switch(
                      value: controlhome.isOpen.value,
                      activeColor: Colors.green,
                      onChanged: (value) {
                        controlhome.setIsOpen(value);
                      })),
                ],
              )
            ],
          ),
        ));
  }
}
