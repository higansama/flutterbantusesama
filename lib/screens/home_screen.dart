import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/models/campaign.dart';
import 'package:flutter_app_travel/screens/detail_campaign_screen.dart';
import 'package:flutter_app_travel/webservices/campaign_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';
import 'package:flutter_app_travel/widgets/custom_tab_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/campaign.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(viewportFraction: 0.877);
  final _campaignServices = CampaignServices();
  List<Campaign> _listCampaignTerbaru = [];
  List<Campaign> _listCampaignTerdekat = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    _fetchCampaignTerbaru();
    _fetchCampaignTerdekat();
  }

  void _fetchCampaignTerbaru() async {
    final response = await _campaignServices.getSoonestCampaign();
    setState(() {
      _listCampaignTerbaru = response;
    });
  }

  void _fetchCampaignTerdekat() async {
    final response = await _campaignServices.getNearestCampaign();
    setState(() {
      _listCampaignTerdekat = response;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarTravel(0),
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: 50.6,
                margin: EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
//                Menu atas
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset("assets/svg/icon_drawer.svg"),
                    ),
                    Container(
                      height: 57.6,
                      width: 57.6,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(0x080a0928),
                      ),
                      child: SvgPicture.asset("assets/svg/icon_search.svg"),
                    ),
                  ],
                ),
              ),
//              Tulisan nature
              Padding(
                padding: EdgeInsets.only(top: 35, left: 28.8),
//                child: Text(
//                  'Explore \nthe Nature',
//                  style: GoogleFonts.playfairDisplay(
//                      fontSize: 45.5, fontWeight: FontWeight.w700),
//                ),
//                Custom tab bar wiht custom indicator
              ),
              Container(
                height: 30,
                margin: EdgeInsets.only(left: 13.4, top: 28.8),
                child: DefaultTabController(
                  length: 1,
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 14, right: 14),
                    indicatorPadding: EdgeInsets.only(left: 14, right: 14),
                    labelColor: Color(0xFF0000000),
                    unselectedLabelColor: Color(0xFF8a8a8a),
                    labelStyle: GoogleFonts.lato(
                        fontSize: 17.0, fontWeight: FontWeight.w900),
                    unselectedLabelStyle: GoogleFonts.lato(
                        fontSize: 17.0, fontWeight: FontWeight.w700),
                    indicator: RoundedRectangleTabIndicator(
                        color: Colors.black, weight: 2.4, width: 14.4),
                    tabs: <Widget>[
                      Tab(
                        child: Container(
                          child: Text('Segera'),
                        ),
                      ),
                      // Tab(
                      //   child: Container(
                      //     child: Text('Pedagang Kaki Lima'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
//              List ciew widget with PageView
//            Recomendation section
              Container(
                height: 218.4,
                margin: EdgeInsets.only(top: 16),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    _listCampaignTerbaru.length,
                    (int index) => InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailCampaign(
                                  1,
                                  _listCampaignTerbaru[index],
                                );
                              },
                            ),
                          );
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 28.8),
                        width: 333.6,
                        height: 218.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage(_listCampaignTerbaru[index].foto),
                          ),
                        ),
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
                                    padding: EdgeInsets.only(
                                        right: 14.4, left: 16.72),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/svg/icon_location.svg'),
                                        SizedBox(width: 9.52),
                                        Text(
                                          _listCampaignTerbaru[index].kecamatan,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
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
                    ),
                  ),
                ),
              ),
//              Smooth pageindicator library
              Padding(
                padding: EdgeInsets.only(top: 38.8, left: 24.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _listCampaignTerbaru.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.black38,
                    dotColor: Color(0xFFababab),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8,
                  ),
                ),
              ),
//              popular category
              Padding(
                padding: EdgeInsets.only(top: 48, left: 28.8, right: 28.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Disekitar Anda',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Show All',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16.8,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF8a8a8a),
                      ),
                    ),
                  ],
                ),
              ),
//              ListView Cateogri section
//              Container(
//                margin: EdgeInsets.only(top: 33.6),
//                height: 45.6,
//                child: ListView.builder(
//                  itemCount: populars.length,
//                  scrollDirection: Axis.horizontal,
//                  physics: BouncingScrollPhysics(),
//                  padding: EdgeInsets.only(left: 28.8, right: 9.6),
//                  itemBuilder: (context, index) {
//                    return Container(
//                      margin: EdgeInsets.only(right: 19.2),
//                      height: 45.6,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(9.6),
//                          color: Color(populars[index].color)),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Image.asset(populars[index].image, height: 16.8),
//                          SizedBox(
//                            width: 19.2,
//                          )
//                        ],
//                      ),
//                    );
//                  },
//                ),
//              ),
//              Beach section
              Container(
                height: 124,
                child: ListView.builder(
                  itemCount: _listCampaignTerdekat.length,
                  padding: EdgeInsets.only(left: 28.8, right: 12),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailCampaign(
                              1,
                              _listCampaignTerbaru[index],
                            );
                          }));
                        });
                      },
                      child: Container(
                        height: 404.8,
                        width: 188.4,
                        margin: EdgeInsets.only(
                            right: 16.8, top: 10.8, bottom: 10.8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              _listCampaignTerdekat[index].foto,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
