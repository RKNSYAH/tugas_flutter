import 'dart:convert';
import 'package:get/get.dart';
import 'package:latihan_api/models/userData.dart';
import 'package:http/http.dart' as http;

class SatuController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<List<UserData>> listSatu = Rx<List<UserData>>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          'https://mocki.io/v1/72e997b1-6204-45f4-ac26-284711dfc038'));

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = jsonDecode(response.body);
        print(content);

        for (Map<String, dynamic> i in content) {
          listSatu.value.add(UserData.fromJson(i));
          print(listSatu.value.length);
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
