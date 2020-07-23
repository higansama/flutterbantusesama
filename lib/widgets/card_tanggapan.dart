import 'dart:math';

import 'package:flutter/material.dart';

class CardTanggapan extends StatefulWidget {
  String Komentar;
  String Tanggapan;
  String Waktu;

  CardTanggapan(komentar, tanggapan, waktu) {
    this.Komentar = komentar;
    this.Tanggapan = tanggapan;
    this.Waktu = waktu;
  }

  @override
  _CardTanggapanState createState() =>
      _CardTanggapanState(this.Komentar, this.Tanggapan, this.Waktu);
}

class _CardTanggapanState extends State<CardTanggapan> {
  String Komentar;
  String Tanggapan;
  String Waktu;

  _CardTanggapanState(komentar, tanggapan, waktu) {
    this.Komentar = komentar;
    this.Tanggapan = tanggapan;
    this.Waktu = waktu;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
          decoration: new BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://images.unsplash.com/photo-1553798194-cc0213ae7f99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80", scale: 9.0)))),
    );
  }
}
