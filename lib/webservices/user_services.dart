import 'package:dio/dio.dart';
import 'package:flutter_app_travel/localstorage/local_services.dart';
import 'package:flutter_app_travel/webservices/config.dart';
class UserServices {
  final _dio = Dio();
  Future getUserData() async {
    final userId = await LocalService.shared.getUserId();
    final url = "$base_url/user/profile?iduser=$userId";
    try {
      var response = await _dio.get(url);
      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future loginUser(data) async {
    final url = "$base_url/login/proses";
    FormData formData = new FormData.fromMap(data);
    try {
      var response = await _dio.post(url, data: formData);
      LocalService.shared.setUserId(response.data["iduser"]);
      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future registerUser(data) async {
    final url = "$base_url/user/register";
    FormData formData = new FormData.fromMap(data);
    try {
      var response = await _dio.post(url, data: formData);
      LocalService.shared.setUserId(response.data["data"]["iduser"]);
      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }
}
