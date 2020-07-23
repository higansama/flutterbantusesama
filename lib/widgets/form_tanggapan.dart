import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTanggapan extends StatefulWidget {
  int idCampaign;

  @override
  FormTanggapan(int id) {
    this.idCampaign = id;
  }
  _FormTanggapanState createState() => _FormTanggapanState();
}

class _FormTanggapanState extends State<FormTanggapan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white12.withOpacity(0.3),
                border: const OutlineInputBorder(),
                hintMaxLines: 32,
                hintText: 'Komentar'),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              onPressed: (){},
              color: Colors.lightBlue,
              child: Icon(Icons.send, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
