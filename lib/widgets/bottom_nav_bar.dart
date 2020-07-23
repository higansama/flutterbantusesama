import 'package:flutter/material.dart';
import 'package:flutter_app_travel/screens/add_new_campaign_screen.dart';
import 'package:flutter_app_travel/screens/all_campaign.dart';
import 'package:flutter_app_travel/screens/home_screen.dart';
import 'package:flutter_app_travel/screens/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationBarTravel extends StatefulWidget {
  int _indexSelect = 0;
  @override
  BottomNavigationBarTravel(int index){
    _indexSelect = index;
  }

  _BottomNavigationBarTravelState createState() =>
      _BottomNavigationBarTravelState(_indexSelect);

}

class _BottomNavigationBarTravelState extends State<BottomNavigationBarTravel> {
  int _selectedIndex = 0;

  _BottomNavigationBarTravelState(int index){
    _selectedIndex = index;
  }
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        }
        break;

      case 1:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return AllCampaign();
          }));
        }
        break;

      case 2:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return AddNewCampaign();
          }));
        }
        break;
      case 3:
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return ProfileScreen();
          }));
        }
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottomNavStyle =
      GoogleFonts.lato(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.4,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5))
      ]),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? new SvgPicture.asset('assets/svg/icon_home_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_home.svg'),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? new SvgPicture.asset('assets/svg/icon_heart_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_heart.svg'),
            title: Text('Heart'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? new SvgPicture.asset('assets/svg/icon_plus_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_plus.svg'),
            title: Text('Plus'),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? new SvgPicture.asset('assets/svg/icon_user_colored.svg')
                : new SvgPicture.asset('assets/svg/icon_user.svg'),
            title: Text('User'),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
    );
  }
}
