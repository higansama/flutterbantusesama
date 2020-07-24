import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/screens/detail_campaign_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CampaignCard extends StatefulWidget {
  @override
  var data;
  String gambar, judul;

  CampaignCard(data, String image, title) {
    this.data = data;
    gambar = image;
    judul = title;
  }

  _CampaignCardState createState() => _CampaignCardState(data, gambar, judul);
}

class _CampaignCardState extends State<CampaignCard> {
  @override
  var data;
  String gambar, judul;

  _CampaignCardState(data, String image, title) {
    this.data = data;
    gambar = image;
    judul = title;
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailCampaign(1, data);
          }));
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 28.8, left: 28.8, bottom: 10),
        width: 333.6,
        height: 218.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.6),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(gambar))),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 19.2,
              left: 19.2,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 19.2,
                    sigmaY: 19.2,
                  ),
                  child: Container(
                    height: 36,
                    padding: EdgeInsets.only(right: 14.4, left: 16.72),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/svg/icon_location.svg'),
                        SizedBox(width: 9.52),
                        Text(
                          judul,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700,
                            color: Colors.amber,
                            fontSize: 16.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
