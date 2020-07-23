import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/models/campaign_model.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';
import 'package:flutter_app_travel/widgets/campaign_card.dart';

class AllCampaign extends StatefulWidget {
  @override
  _AllCampaignState createState() => _AllCampaignState();
}

class _AllCampaignState extends State<AllCampaign> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Campaign Hari Ini",
            style: TextStyle(color: Colors.black38),
          ),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  setState(() {
                    final sb = new SnackBar(content: Text("Helo"));
                    Scaffold.of(context).showSnackBar(sb);
                  });
                },
                label: Text(""),
                icon: Icon(Icons.sort))
          ],
        ),
        bottomNavigationBar: BottomNavigationBarTravel(1),
        body: SafeArea(
          child: Container(
            child: ListView.builder(
                itemCount: allcampaigndatas.length,
                itemBuilder: (context, index) {
                  return CampaignCard(index, allcampaigndatas[index].image, allcampaigndatas[index].kelurahan + ", " + allcampaigndatas[index].kecamatan);
                }),
          ),
        ),
      ),
    );
  }
}
