import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_travel/screens/home_screen.dart';
import 'package:flutter_app_travel/screens/login_screen.dart';
import 'package:flutter_app_travel/webservices/alamat_services.dart';
import 'package:flutter_app_travel/webservices/campaign_services.dart';
import 'package:flutter_app_travel/webservices/user_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nomerHPController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userServices = UserServices();
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

  void registerUser(ctx) async {
    final data = {
      "username": _usernameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "provinsi": selectedProvinsi["id"],
      "kecamatan": selectedKecamatan["id"],
      "kota": selectedKota["id"],
      "kelurahan": selectedKelurahan["id"],
      "nohp": _nomerHPController.text,
    };
    final res = await _userServices.registerUser(data);
    if (res["code"] == 200) {
      print(res["data"]);
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Registrasi Sukses"),
      ));
      setState(() {
        _usernameController.text = "";
        _emailController.text = "";
        _passwordController.text = "";
        _nomerHPController.text = "";
        selectedKota = null;
        selectedKecamatan = null;
        selectedKelurahan = null;
        listKota = [];
        listKecamatan = [];
        listKelurahan = [];
        selectedProvinsi = null;
        listProvinsi = [];
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Registrasi gagal"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Register"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
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
                keyboardType: TextInputType.phone,
                controller: _nomerHPController,
                decoration: InputDecoration(labelText: 'No Hp'),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sudah punya akun? Login",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) => RaisedButton(
                onPressed: () {
                  this.registerUser(context);
                },
                color: Colors.orangeAccent,
                child: Text(
                  "Register",
                ),
              ),
            )
          ],
        ));
  }
}
