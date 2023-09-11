import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'ncontroller.dart';
import 'package:get/get.dart';

class ListState extends StatelessWidget {
  const ListState({super.key});

  @override
  Widget build(BuildContext context) {
    countControl xc = Get.put(countControl());
    return Scaffold(
      appBar: AppBar(
        title: Text("ListMenu"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 450,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 46, 79),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<countControl>(builder: (c) {
                        return Text("x: ${xc.x}");
                      })
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                width: 450,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 46, 79),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    xc.increment();
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Increase")],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                width: 450,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 46, 79),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    xc.decrement();
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Decrease")],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 450,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 46, 154, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Obx(() => Text("y: ${xc.y}"))],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                width: 450,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 46, 154, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    xc.increaseY();
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Increase")],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                width: 450,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 46, 154, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    xc.decreaseY();
                  },
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Decrease")],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
