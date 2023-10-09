import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_api/controllers/satu_controller.dart';

class ScreenSatu extends StatelessWidget {
  const ScreenSatu({super.key});

  @override
  Widget build(BuildContext context) {
    SatuController controlSatu = Get.put(SatuController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  width: 100,
                  height: 150,
                  color: Color.fromARGB(255, 59, 59, 59),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed("/DataPost");
                        },
                        child: Text("Posts"),
                      ),
                    ],
                  ),
                ));
              },
              icon: Icon(Icons.menu))
        ],
      ),
      body: Container(
          child: Obx(() => controlSatu.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controlSatu.listSatu.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child:
                            Text('${controlSatu.listSatu.value[index].userid}'),
                      ),
                      title: Text('${controlSatu.listSatu.value[index].nama}'),
                      subtitle:
                          Text('${controlSatu.listSatu.value[index].email}'),
                    );
                  }))),
    );
  }
}
