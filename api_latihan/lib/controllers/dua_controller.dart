import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_api/models/userPost.dart';

class DuaController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<List<UserPost>> listDua = Rx<List<UserPost>>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          'https://mocki.io/v1/b82bf3d6-a2c8-41ad-bae9-00b06aa45e85'));

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body);
        print(content);

        for (Map<String, dynamic> i in content) {
          listDua.value.add(UserPost.fromJson(i));
          print(listDua.value.length);
        }
      } else {
        isLoading.value = false;
        print('Error');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
