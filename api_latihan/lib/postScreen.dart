import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_api/controllers/dua_controller.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    DuaController controlDua = Get.find();
    var args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts ${controlDua.listDua.value[args].firstname}"),
      ),
      body: Container(
          child: Obx(() => controlDua.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controlDua.listDua.value[args].posts?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child:
                            Text('${controlDua.listDua.value[args].firstname}'),
                      ),
                      title: Text(
                          '${controlDua.listDua.value[args].posts?[index].title}'),
                      subtitle: Text(
                          '${controlDua.listDua.value[args].posts?[index].content}'),
                    );
                  }))),
    );
  }
}
