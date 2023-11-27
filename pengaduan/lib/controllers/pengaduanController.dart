import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/pengaduan.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

const uri = "http://localhost:5000";

class PengaduanController extends GetxController {
  List list = [].obs;
  RxBool web = false.obs;
  var isWeb = kIsWeb.obs;
  Uint8List? fileToDisplayWeb;
  PlatformFile? imagePicked;
  RxList<int> bytes = RxList<int>([]);
  RxBool chosen = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getPengaduan();
  }

  Future<void> getPengaduan() async {
    final response = await http.get(Uri.parse("$uri/pengaduan"));
    final jsonData = jsonDecode(response.body);
    List<Pengaduan> futureList = [];
    for (Map<String, dynamic> data in jsonData) {
      futureList.add(Pengaduan.fromJson(data));
    }
    list.assignAll(futureList);
  }

  Future<http.StreamedResponse> postPengaduan(Map data) async {
    final request = await http.MultipartRequest(
      "POST",
      Uri.parse("$uri/pengaduan"),
    );

    Map<String, String> obj =
        data.map((key, value) => MapEntry(key, value!.toString()));
    request.fields.addAll(obj);
    request.files.add(
        http.MultipartFile.fromBytes("image", imagePicked!.bytes as List<int>));

    var response = await request.send();
    getPengaduan();
    return response;
  }

  Future<http.StreamedResponse> updatePengaduan(String id, Map data) async {
    final request = await http.MultipartRequest(
      "PATCH",
      Uri.parse("$uri/pengaduan/$id"),
    );

    Map<String, String> obj =
        data.map((key, value) => MapEntry(key, value!.toString()));
    request.fields.addAll(obj);
    request.files.add(
        http.MultipartFile.fromBytes("image", imagePicked!.bytes as List<int>));

    var response = await request.send();
    getPengaduan();
    return response;
  }

  Future<http.Response> deletePengaduan(String nik) async {
    final response = await http.delete(Uri.parse("$uri/pengaduan/$nik"));
    getPengaduan();
    return response;
  }

  Future<void> pickImage() async {
    try {
      chosen.value = false;

      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        imagePicked = result.files.first;
        chosen.value = true;
      } else {
        chosen.value = true;
        print(result);
      }
    } catch (e) {
      print(e);
    }
  }
}
