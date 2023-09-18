import 'package:dialog/homecontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControl control = Get.put(HomeControl());
    return Scaffold(
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
              onPressed: () {
                control.decreaseNum();
              },
              icon: Icon(Icons.remove)),
          Obx(() => Text(control.num.value.toString())),
          IconButton(
              onPressed: () {
                control.IncreaseNum();
              },
              icon: Icon(Icons.add))
        ]),
      ),
    );
  }
}
