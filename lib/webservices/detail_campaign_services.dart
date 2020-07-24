import 'package:dio/dio.dart';
import 'package:flutter_app_travel/models/campaign.dart';
import 'package:flutter_app_travel/webservices/config.dart';

class CampaignDetailService {
  final _dio = Dio();

  Future<Campaign> getDetailCampaign(campaignId) async {
    final url = "$base_url/detail/campaign?idcampaign=$campaignId";
    try {
      var response = await _dio.get(url);
      var data = Campaign.fromJSON(response.data["data"]["campaign"][0]);
      return data;
    } on DioError catch (e) {
      print(e);
    }
  }

  Future actionLikeCampaign(String campaignId) async {
    final url = "$base_url/like/campaign";
    final data = {
      "id_user": 31,
      "id_campaign": campaignId,
    };
    try {
      final response = await _dio.post(url, data: data);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e);
      return e.response.data;
    }
  }

  Future actionRememberCampaign(String campaignId) async {
    final url = "$base_url/remember/campaign";
    final data = {
      "id_user": 31,
      "id_campaign": campaignId,
    };
    try {
      final response = await _dio.post(url, data: data);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e);
      return e.response.data;
    }
  }

  Future actionCommentCampaign(String campaignId, String message) async {
    final url = "$base_url/remember/campaign";
    final data = {
      "id_user": 31,
      "id_campaign": campaignId,
      "isi_komentar": message
    };
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response.data;
    }
  }

  Future actionFollowCampaign(String campaignId) async {
    final url = "$base_url/follow/campaign";
    final data = {
      "id_user": 31,
      "id_campaign": campaignId,
    };
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } on DioError catch (e) {
      print(e);
      return e.response.data;
    }
  }
}
