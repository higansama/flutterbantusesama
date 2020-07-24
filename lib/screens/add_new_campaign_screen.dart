import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/webservices/alamat_services.dart';
import 'package:flutter_app_travel/webservices/campaign_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';

class AddNewCampaign extends StatefulWidget {
  @override
  _AddNewCampaignState createState() => _AddNewCampaignState();
}

class _AddNewCampaignState extends State<AddNewCampaign> {
  TextEditingController _judulCampaignController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _deskripsiCampaignController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final campaignServices = CampaignServices();
  final alamatServices = AlamatServices();
  var selectedProvinsi;
  var selectedKota;
  var selectedKecamatan;
  var selectedKelurahan;
  List listProvinsi = [];
  List listKota = [];
  List listKecamatan = [];
  List listKelurahan = [];

  @override
  void initState() {
    super.initState();
    _getProvinsiData();
  }

  void _getProvinsiData() async {
    final response = await alamatServices.getProvinsiData();
    if (response["code"] == 200) {
      setState(() {
        listProvinsi = response["data"];
      });
    }
  }

  void _onSelectProvinsi(item) async {
    setState(() {
      selectedKota = null;
      selectedKecamatan = null;
      selectedKelurahan = null;
      listKota = [];
      listKecamatan = [];
      listKelurahan = [];
    });
    final response = await alamatServices.getKotaData(item["id"]);
    if (response["code"] == 200) {
      setState(() {
        listKota = response["data"];
      });
    }
  }

  void _onSelectKota(item) async {
    setState(() {
      selectedKecamatan = null;
      selectedKelurahan = null;
      listKecamatan = [];
      listKelurahan = [];
    });
    final response = await alamatServices.getKecamatanData(item["id"]);
    if (response["code"] == 200) {
      setState(() {
        listKecamatan = response["data"];
      });
    }
  }

  void _onSelectKecamatan(item) async {
    setState(() {
      selectedKelurahan = null;
      listKelurahan = [];
    });
    final response = await alamatServices.getKelurahanData(item["id"]);
    if (response["code"] == 200) {
      setState(() {
        listKelurahan = response["data"];
      });
    }
  }

  void saveNewCampaignPressed(ctx) async {
    final data = {
      "foto": _imageUrlController.text,
      "nama_campaign": _judulCampaignController.text,
      "latar_cerita": _deskripsiCampaignController.text,
      "provinsi": selectedProvinsi["id"],
      "kecamatan": selectedKecamatan["id"],
      "kota": selectedKota["id"],
      "kelurahan": selectedKelurahan["id"],
      "nama_jalan": _alamatController.text,
      "id_user": 31,
      "date_expired": "2020-07-30"
    };
    final res = await campaignServices.postNewCampaign(data);
    if (res["code"] == 200) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Sukses menambah campaign baru"),
      ));
      setState(() {
        _imageUrlController.text = "";
        _judulCampaignController.text = "";
        _deskripsiCampaignController.text = "";
        _alamatController.text = "";
        selectedKota = null;
        selectedKecamatan = null;
        selectedKelurahan = null;
        listKota = [];
        listKecamatan = [];
        listKelurahan = [];
        selectedProvinsi = null;
        listProvinsi = [];
      });
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Gagal menambah campaign"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Tambahkan Campaign Baru"),
          backgroundColor: Colors.orangeAccent,
        ),
        bottomNavigationBar: BottomNavigationBarTravel(2),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Path Picture'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _judulCampaignController,
                decoration: InputDecoration(labelText: 'Judul Campaign'),
                maxLength: 30,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _deskripsiCampaignController,
                decoration: InputDecoration(
                  labelText: 'Deskripsi Campaign',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: DropdownButton(
                isExpanded: true,
                hint: Text("Provinsi"),
                value: selectedProvinsi,
                items: listProvinsi.map((item) {
                  return DropdownMenuItem(
                    child: Text(item["label"]),
                    value: item,
                  );
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    selectedProvinsi = item;
                    this._onSelectProvinsi(item);
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: DropdownButton(
                hint: Text("Kota"),
                isExpanded: true,
                value: selectedKota,
                items: listKota.map((item) {
                  return DropdownMenuItem(
                    child: Text(item["label"]),
                    value: item,
                  );
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    selectedKota = item;
                    this._onSelectKota(item);
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: DropdownButton(
                hint: Text("Kecamatan"),
                isExpanded: true,
                value: selectedKecamatan,
                items: listKecamatan.map((item) {
                  return DropdownMenuItem(
                    child: Text(item["label"]),
                    value: item,
                  );
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    selectedKecamatan = item;
                    this._onSelectKecamatan(item);
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: DropdownButton(
                hint: Text("Kelurahan"),
                isExpanded: true,
                value: selectedKelurahan,
                items: listKelurahan.map((item) {
                  return DropdownMenuItem(
                    child: Text(item["label"]),
                    value: item,
                  );
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    selectedKelurahan = item;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
              ),
            ),
            Builder(
              builder: (context) => RaisedButton(
                onPressed: () {
                  this.saveNewCampaignPressed(context);
                },
                color: Colors.orangeAccent,
                child: Text(
                  "Tambah campaign",
                ),
              ),
            )
          ],
        ));
  }
}
