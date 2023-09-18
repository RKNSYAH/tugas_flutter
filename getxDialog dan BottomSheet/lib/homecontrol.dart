import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControl extends GetxController {
  TextEditingController fieldNama = TextEditingController();

  //Reactive
  // RxString nama = RxString("");

  // void changeName(String vName) {
  //   nama.value = vName;
  //   print(nama.value);

  // }

  RxBool isOpen = RxBool(true);
  
  Rx<int> num = Rx<int>(0);

  //Simple
  String nama = "";

  void IncreaseNum() {
    num.value++;
  }

  void decreaseNum() {
    num.value--;
  }

  void changeValue(String vName) {
    nama = vName;
    update();
  }

  void setIsOpen(bool open) {
    isOpen(open);
    print(isOpen);
  }
}
