import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class Campaign {
  String NamaCampaign, Kota, Kecamatan, Kelurahan, Foto;
  Campaign(
      {this.NamaCampaign,
      this.Kota,
      this.Kecamatan,
      this.Kelurahan,
      this.Foto});

  factory Campaign.createCampaignObject(Map<String, dynamic> object) {
    return Campaign(
      NamaCampaign: object["nama_campaign"],
      Kota: object["kota"],
      Kecamatan: object["kecamatan"],
      Kelurahan: object["kelurahan"],
      Foto: object["foto"],
    );
  }

  static Future<List<Campaign>> getCampaign(String sorting) async {
    String apiUrl = "http://10.0.2.2:8081/list/campaign?sort=" + sorting;
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listCampaign = (jsonObject as Map<String, dynamic>)['data'];

    List<Campaign> Campaigns = [];
    for (int i = 0; i < listCampaign.length; i++) {
      print(listCampaign[i]);
      Campaigns.add(Campaign.createCampaignObject(listCampaign[i]));
    }

    return Campaigns;
  }
}


