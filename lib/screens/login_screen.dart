import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/screens/home_screen.dart';
import 'package:flutter_app_travel/screens/register_screen.dart';
import 'package:flutter_app_travel/webservices/user_services.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _userServices = UserServices();

  @override
  void initState() {
    super.initState();
  }

  void _loginUser(ctx) async {
    final data = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    final res = await _userServices.loginUser(data);
    if (res["code"] == 200) {
      setState(() {
        _emailController.text = "";
        _passwordController.text = "";
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(res["msg"]),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Tidak punya akun? Register",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Builder(
              builder: (context) => RaisedButton(
                onPressed: () {
                  this._loginUser(context);
                },
                color: Colors.orangeAccent,
                child: Text(
                  "Login",
                ),
              ),
            )
          ],
        ));
  }
}
