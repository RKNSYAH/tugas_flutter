import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/tanggapan.dart';

const uri = "http://localhost:5000";

class TanggapanController extends GetxController {
  List list = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getTanggapan();
  }

  Future<void> getTanggapan() async {
    final response = await http.get(Uri.parse("$uri/tanggapan"));
    final jsonData = jsonDecode(response.body);
    List<Tanggapan> futureList = [];
    for (Map<String, dynamic> data in jsonData) {
      print(data);
      futureList.add(Tanggapan.fromJson(data));
    }
    list.assignAll(futureList);
  }

  Future<http.Response> postTanggapan(Map data) async {
    final request = await http.post(
      Uri.parse("$uri/tanggapan"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return request;
  }

  Future<http.Response> updateTanggapan(String nik, Map data) async {
    final response = await http.patch(Uri.parse("$uri/tanggapan/$nik"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    return response;
  }

  Future<http.Response> deleteTanggapan(String nik) async {
    final response = await http.delete(Uri.parse("$uri/tanggapan/$nik"));
    return response;
  }
}
