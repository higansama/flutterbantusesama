import 'package:dio/dio.dart';
import 'package:flutter_app_travel/webservices/config.dart';

import '../models/campaign.dart';

class CampaignServices {
  final _dio = Dio();
  Future<List<Campaign>> getSoonestCampaign() async {
    final url = "$base_url/list/campaign?sort=terbaru";
    final campaign = await _fetchCampaignData(url);
    return campaign;
  }

  Future<List<Campaign>> getNearestCampaign() async {
    // 3273
    final url = "$base_url/list/campaign?sort=terbaru&kota=3273";
    final campaign = await _fetchCampaignData(url);
    return campaign;
  }

  Future<List<Campaign>> getTodaysCampaign() async {
    final url = "$base_url/list/campaign?sort=today";
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

  Future postNewCampaign(data) async {
    final url = "$base_url/create/campaign";
    FormData formData = new FormData.fromMap(data);
    try {
      var response = await _dio.post(url, data: formData);
      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }
}
