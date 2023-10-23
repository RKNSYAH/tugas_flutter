import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/petugas.dart';

const uri = "http://localhost:5000";

class PetugasController extends GetxController {
  List list = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getPetugas();
  }

  Future<void> getPetugas() async {
    final response = await http.get(Uri.parse("$uri/petugas"));
    final jsonData = jsonDecode(response.body);
    List<Petugas> futureList = [];
    for (Map<String, dynamic> data in jsonData) {
      futureList.add(Petugas.fromJson(data));
    }
    list.assignAll(futureList);
  }

  Future<http.Response> postPetugas(Map data) async {
    final request = await http.post(
      Uri.parse("$uri/Petugas"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return request;
  }

  Future<http.Response> updatePetugas(String nik, Map data) async {
    print(nik);
    final response = await http.patch(Uri.parse("$uri/petugas/$nik"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    return response;
  }

  Future<http.Response> deletePetugas(String nik) async {
    final response = await http.delete(Uri.parse("$uri/petugas/$nik"));
    return response;
  }
}
