import 'package:dio/dio.dart';
import 'package:flutter_app_travel/webservices/config.dart';

class CampaignDetailService {
  final _dio = Dio();
  Future actionLikeCampaign(String campaignId) async {
    final url = "$base_url/list/campaign?sort=nearest";
    try {
      var response = await _dio.post(url, data: campaignId);
    } on DioError catch (e) {
      print(e);
    }
  }

  Future actionRememberCampaign(String campaignId) async {
    final url = "$base_url/list/campaign?sort=nearest";
    try {
      var response = await _dio.post(url, data: campaignId);
    } on DioError catch (e) {
      print(e);
    }
  }
}
