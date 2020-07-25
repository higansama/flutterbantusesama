import 'package:flutter/material.dart';
import 'package:flutter_app_travel/localstorage/local_services.dart';
import 'package:flutter_app_travel/models/campaign.dart';
import 'package:flutter_app_travel/screens/detail_campaign_screen.dart';
import 'package:flutter_app_travel/screens/login_screen.dart';
import 'package:flutter_app_travel/webservices/user_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _userServices = UserServices();
  var _userData;
  List<Campaign> _likedData = [];
  List<Campaign> _rememberedData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserProfileData();
  }

  void _getUserProfileData() async {
    final res = await _userServices.getUserData();
    final refactoredLikedData = this._refactorLikedData(res["data"]["likes"]);
    final refactoredRememberData =
        this._refactorLikedData(res["data"]["remember"]);
    setState(() {
      _likedData = refactoredLikedData;
      _rememberedData = refactoredRememberData;
      _userData = res["data"]["profile"];
    });
  }

  List<Campaign> _refactorLikedData(data) {
    List<Campaign> refactoredData = [];
    for (var campaign in data) {
      refactoredData.add(Campaign.fromJSON(campaign));
    }
    return refactoredData;
  }

  List<Campaign> _refactorRememberedData(data) {
    List<Campaign> refactoredData = [];
    for (var campaign in data) {
      refactoredData.add(Campaign.fromJSON(campaign));
    }
    return refactoredData;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text(
              _userData != null ? _userData["email"] : "Loading...",
            ),
            bottom: TabBar(
              indicatorColor: Colors.deepOrange,
              tabs: <Widget>[
                Tab(text: "Disukai"),
                Tab(
                  text: "Diingat",
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBarTravel(3),
          body: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      ListView.builder(
                        itemCount: _likedData.length,
                        itemBuilder: (context, index) {
                          final campaign = _likedData[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailCampaign(
                                      1,
                                      campaign,
                                    );
                                  },
                                ),
                              );
                            },
                            title: Text(
                              campaign.namaCampaign,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: _rememberedData.length,
                        itemBuilder: (context, index) {
                          final campaign = _rememberedData[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailCampaign(
                                      1,
                                      campaign,
                                    );
                                  },
                                ),
                              );
                            },
                            title: Text(
                              campaign.namaCampaign,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      LocalService.shared.removeUserId();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    color: Colors.white,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
