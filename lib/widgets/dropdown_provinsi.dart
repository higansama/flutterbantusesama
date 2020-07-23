import 'package:flutter/material.dart';
import 'package:flutter_app_travel/models/provinsi.dart';

class DropdownProvinsi extends StatefulWidget {
  @override
  _DropdownProvinsiState createState() => _DropdownProvinsiState();
}

class _DropdownProvinsiState extends State<DropdownProvinsi> {
  List<DropdownMenuItem<String>> dataProvinsi;
  String selectedProvinsi;

  _DropdownProvinsiState() {
    Provinsi.getProvinsi().then((r) {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedProvinsi,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          selectedProvinsi = newValue;
        });
      },
      // items: dataProvinsi.map<DropdownMenuItem<String>>((String value){
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Text(value),
      //   );
      // }).toList(),
    );
  }
}
