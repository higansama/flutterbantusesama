import 'package:flutter/material.dart';
import 'package:flutter_app_travel/models/campaign.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: Text("John Doe"),
          ),
          bottomNavigationBar: BottomNavigationBarTravel(3),
          body: Container(
            child: ListView(
              children: <Widget>[
                Center(
                    child: Image.network(
                        "https://images.unsplash.com/photo-1553798194-cc0213ae7f99?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80")),
                FlatButton(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
