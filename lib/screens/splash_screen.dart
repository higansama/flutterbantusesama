import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_travel/localstorage/local_services.dart';
import 'package:flutter_app_travel/screens/home_screen.dart';
import 'package:flutter_app_travel/screens/login_screen.dart';
import 'package:flutter_app_travel/screens/register_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateUserByLoginStatus();
  }

  void _navigateUserByLoginStatus() async {
    final String res = await LocalService.shared.getUserId();
    if (res == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Splash Screen"),
        ),
      ),
    );
  }
}
