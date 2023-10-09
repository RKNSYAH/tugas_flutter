import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_api/controllers/dua_controller.dart';
import 'package:latihan_api/postScreen.dart';

class ScreenDua extends StatelessWidget {
  const ScreenDua({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController controlDua = Get.put(DuaController());
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
                          Get.toNamed("/DataUser");
                        },
                        child: Text("Data User"),
                      ),
                    ],
                  ),
                ));
              },
              icon: Icon(Icons.menu))
        ],
      ),
      body: Container(
          child: Obx(() => controlDua.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controlDua.listDua.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                            '${controlDua.listDua.value[index].firstname}'),
                      ),
                      title:
                          Text('${controlDua.listDua.value[index].createdAt}'),
                      subtitle: Text(
                          '${controlDua.listDua.value[index].posts?.map((e) => e.title)}'),
                      onTap: () {
                        Get.to(PostDetail(), arguments: index);
                      },
                    );
                  }))),
    );
  }
}
