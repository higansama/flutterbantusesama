import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/widgets/bottom_nav_bar.dart';
import 'package:flutter_app_travel/widgets/dropdown_provinsi.dart';

class AddNewCampaign extends StatefulWidget {
  @override
  _AddNewCampaignState createState() => _AddNewCampaignState();
}

class _AddNewCampaignState extends State<AddNewCampaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambahkan Campaign Baru"),
        backgroundColor: Colors.orangeAccent,
      ),
        bottomNavigationBar: BottomNavigationBarTravel(2),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Path Picture'
                ),
                maxLength: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Judul Campaign'
                ),
                maxLength: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
//              child: DropdownProvinsi(),
            )
            ,Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Kota'
                ),
                maxLength: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Kecamatan'
                ),
                maxLength: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Kelurahan'
                ),
                maxLength: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Judul Campaign'
                ),
                maxLength: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Judul Campaign',
                ),
                maxLength: 10,
              ),
            ),


          ],
        ));
  }
}
