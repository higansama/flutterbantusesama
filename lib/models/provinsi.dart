import 'dart:convert';
import 'package:http/http.dart' as http;


class Provinsi{
  String id, label;
  Provinsi({this.id, this.label});

  factory Provinsi.createProvinsiObject(Map<String, dynamic> object){
    return Provinsi(
        id: object["id"].toString(),
        label: object["label"]
    );
  }

  static Future<List<Provinsi>> getProvinsi() async {
    String apiUrl = "http://192.168.0.104:8081/get/provinsi";
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listProvinsi =  (jsonObject as Map<String, dynamic>)['data'];

    List<Provinsi> Provinsis = [];
    for (int i = 0 ; i < listProvinsi.length; i++){
      print(listProvinsi[i]);
      Provinsis.add(Provinsi.createProvinsiObject(listProvinsi[i]));
    }

    return Provinsis;
  }
}