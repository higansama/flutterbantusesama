import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/models/campaign_model.dart';
import 'package:flutter_app_travel/webservices/campaign_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';
import 'package:flutter_app_travel/widgets/campaign_card.dart';

class AllCampaign extends StatefulWidget {
  @override
  _AllCampaignState createState() => _AllCampaignState();
}

class _AllCampaignState extends State<AllCampaign> {
  final campaignServices = CampaignServices();
  List _listCampaignHariIni = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTodaysCampaign();
  }

  void _getTodaysCampaign() async {
    final response = await campaignServices.getTodaysCampaign();
    print(response);
    setState(() {
      _listCampaignHariIni = response;
    });
  }

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
                itemCount: _listCampaignHariIni.length,
                itemBuilder: (context, index) {
                  return CampaignCard(
                    _listCampaignHariIni[index],
                    _listCampaignHariIni[index].foto,
                    _listCampaignHariIni[index].kelurahan +
                        ", " +
                        _listCampaignHariIni[index].kecamatan,
                  );
                }),
          ),
        ),
      ),
    );
  }
}
