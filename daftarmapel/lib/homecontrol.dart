import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControl extends GetxController {
  TextEditingController namakelas = TextEditingController();

  TextEditingController namaSiswa = TextEditingController();
  TextEditingController mapelkode = TextEditingController();
  TextEditingController mapelnama = TextEditingController();

  RxBool isOpen = RxBool(true);
  Rx<int> num = Rx<int>(0);
  RxList daftarNama = RxList([]);
  RxMap<String, String> dataMapel = RxMap<String, String>();
  RxString namaKelas = "XII RPL 2".obs;

  void addList(String nama) {
    daftarNama.add(nama);
    print(daftarNama.value);
  }

  void addMapel(String namaMapel, String kodeMapel) {
    dataMapel[kodeMapel] = namaMapel;
    print(dataMapel.value);
  }

  void editKelas(String namKelasBaru) {
    namaKelas.value = namKelasBaru;
  }

  //Simple
  String nama = "";

  void IncreaseNum() {
    if (num == 35) {
      Get.snackbar("Error", "Siswa maksimal 35");
      isOpen.value = false;
    } else {
      num.value++;
    }
  }

  void decreaseNum() {
    if (num == 0) {
      Get.snackbar("Error", "Jumlah siswa tidak bisa kurang dari 0");
    } else {
      num.value--;
    }
  }

  void setIsOpen(bool open) {
    isOpen(open);
    print(isOpen);
  }
}
