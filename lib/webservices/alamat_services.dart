import 'package:dio/dio.dart';
import 'package:flutter_app_travel/webservices/config.dart';

class AlamatServices {
  final _dio = Dio();
  Future getProvinsiData() async {
    final url = "$base_url/get/provinsi";
    final data = await _fetchData(url);
    return data;
  }

  Future getKotaData(provinsiId) async {
    final url = "$base_url/get/kota?id_prov=$provinsiId";
    final data = await _fetchData(url);
    return data;
  }

  Future getKecamatanData(String kotaId) async {
    final url = "$base_url/get/kecamatan?id_kota=$kotaId";
    final data = await _fetchData(url);
    return data;
  }

  Future getKelurahanData(String kecamatanId) async {
    final url = "$base_url/get/kelurahan?id_kecamatan=$kecamatanId";
    final data = await _fetchData(url);
    return data;
  }

  Future _fetchData(String url) async {
    try {
      var response = await _dio.get(url);
      return response.data;
    } on DioError catch (e) {
      print(e);
    }
  }
}
