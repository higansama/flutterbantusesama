import 'package:dio/dio.dart';
import 'package:flutter_app_travel/localstorage/local_services.dart';
import 'package:flutter_app_travel/webservices/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/campaign.dart';

class UserServices {
  final _dio = Dio();
  Future getUserData() async {
    final url = "$base_url/list/campaign?sort=terbaru";
    final campaign = await _fetchCampaignData(url);
    return campaign;
  }

  Future _fetchCampaignData(String url) async {
    List<Campaign> _campaigns = [];
    try {
      var response = await _dio.get(url);
      for (var campaign in response.data["data"]) {
        _campaigns.add(
          Campaign.fromJSON(campaign),
        );
      }
    } on DioError catch (e) {
      print(e);
    }
    return _campaigns;
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
      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }
}
