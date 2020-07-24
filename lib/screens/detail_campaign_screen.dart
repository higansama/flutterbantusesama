import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app_travel/models/campaign.dart';
import 'package:flutter_app_travel/models/campaign_model.dart';
import 'package:flutter_app_travel/webservices/detail_campaign_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';
import 'package:flutter_app_travel/widgets/form_tanggapan.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCampaign extends StatefulWidget {
  int buttonNavBar;
  var campaignData;
  DetailCampaign(int indexBnb, Campaign data) {
    buttonNavBar = indexBnb;
    campaignData = data;
  }

  @override
  _DetailCampaignState createState() =>
      _DetailCampaignState(buttonNavBar, campaignData);
}

class _DetailCampaignState extends State<DetailCampaign> {
  final detailCampService = CampaignDetailService();
  int buttonNavBar;
  Campaign campaignData;
  _DetailCampaignState(int bnb, Campaign data) {
    buttonNavBar = bnb;
    campaignData = data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getCampaignDetail(campaignData.id);
  }

  void _getCampaignDetail(campaignId) async {
    final response = await detailCampService.getDetailCampaign(campaignId);
    setState(() {
      campaignData = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBarTravel(1),
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text(campaignData.namaCampaign),
            bottom: TabBar(
              indicatorColor: Colors.deepOrange,
              tabs: <Widget>[
                Tab(text: "Latar Kisah"),
                Tab(
                  text: "Tanggapan",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
//              Latar Kisah Tab Bar
              ListView(
                shrinkWrap: true,
                children: <Widget>[
//                  gambar campaign
                  Container(
                    height: 300,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 16.8),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                campaignData.foto,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.favorite_border,
                              color: Colors.redAccent),
                          onPressed: () async {
                            await detailCampService.actionLikeCampaign(
                              this.campaignData.id,
                            );
                          },
                        ),
                        FlatButton(
                          child: Icon(Icons.share, color: Colors.blueAccent),
                          onPressed: () {},
                        ),
                        FlatButton(
                          onPressed: () async {
                            await detailCampService.actionRememberCampaign(
                              this.campaignData.id,
                            );
                          },
                          child: Icon(Icons.add_circle_outline,
                              color: Colors.amberAccent),
                        )
                      ],
                    ),
                  ),
//                  Judul
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, top: 2.0),
                    child: Text(
                      this.campaignData.namaCampaign,
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                  ),
//                Pelapor
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 15),
                  //     child: Text(
                  //       "John Doe",
                  //       style: GoogleFonts.playfairDisplay(
                  //           fontSize: 18.4, fontWeight: FontWeight.w700),
                  //     ),
                  //   ),
                  // ),
//                  Isi latar belakang
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 12, left: 12),
                    child: Container(
                      color: Colors.black45.withOpacity(0.2),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 12, left: 15),
                        child: Text(
                          this.campaignData.description != null
                              ? this.campaignData.description
                              : "",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  )
                ],
              ),
//               Tanggapan
              ListView(
                children: <Widget>[
//                Tambah tanggapan
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Tanggapi Campaign Ini"),
                                    content: new FormTanggapan(
                                        int.parse(this.campaignData.id)),
                                    actions: <Widget>[],
                                  );
                                },
                              );
                            },
                            color: Colors.amber,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//                Kartu Tanggapan
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
//                        profile foto komentar
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1553798194-cc0213ae7f99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80"),
                              )),
                        ),
//                        tanggal komentar
                        Container(
                          margin: EdgeInsets.only(top: 9.8),
                          width: 300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
//                              Nama
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    fontSize: 18.5,
                                    color: Colors.black.withAlpha(100),
                                    fontWeight: FontWeight.w500),
                              ),
//                              Tanggal
                              Text(
                                "22 Juli 2020",
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
//                              Isi Komentar
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                                  style: TextStyle(),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
