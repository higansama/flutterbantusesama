import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTanggapan extends StatefulWidget {
  int idCampaign;
  Function onSendNewTanggapan;
  @override
  FormTanggapan(int id, Function onSendNewTanggapan) {
    this.idCampaign = id;
    this.onSendNewTanggapan = onSendNewTanggapan;
  }
  _FormTanggapanState createState() => _FormTanggapanState();
}

class _FormTanggapanState extends State<FormTanggapan> {
  TextEditingController _tanggapanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _tanggapanController,
            decoration: InputDecoration(
                fillColor: Colors.white12.withOpacity(0.3),
                border: const OutlineInputBorder(),
                hintMaxLines: 32,
                hintText: 'Komentar'),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              onPressed: () {
                widget.onSendNewTanggapan(_tanggapanController.text);
              },
              color: Colors.lightBlue,
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
