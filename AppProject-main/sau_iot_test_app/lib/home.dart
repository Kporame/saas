//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'package:sau_iot_test_app/model/member.dart';
import 'package:sau_iot_test_app/view/home3_ui.dart';
import 'package:sau_iot_test_app/view/login_UI.dart';
import 'package:sau_iot_test_app/view/map.dart';
import 'package:sau_iot_test_app/view/phgraph_ui.dart';
import 'package:sau_iot_test_app/view/tdsgraph_ui.dart';
import 'package:sau_iot_test_app/view/tempgraph_ui.dart';

class HomeUI extends StatefulWidget {
  Member? member;
  HomeUI({super.key, this.member});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  double value = 10;
  GlobalKey<_HomeUIState> globalKey = GlobalKey<_HomeUIState>();
  GlobalKey<_HomeUIState> globalKey1 = GlobalKey<_HomeUIState>();
  GlobalKey<_HomeUIState> globalKey2 = GlobalKey<_HomeUIState>();

  @override
  Widget build(BuildContext context) {
    TableRow _tableRow = const TableRow(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('PH'),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('TDS'),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('temp'),
      ),
    ]);

    TableRow _tablerow = const TableRow(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('0'),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('0'),
      ),
      Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('0'),
      ),
    ]);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        title: Text(
          "HOME",
          style: GoogleFonts.lemon(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginUI()),
              );
            },
            icon: Icon(FontAwesomeIcons.doorOpen),
          ),
        ],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    defaultColumnWidth: const FixedColumnWidth(90.0),
                    children: <TableRow>[
                      _tableRow,
                      _tablerow,
                    ],
                  ),
                   SizedBox(
              height: 20,
                        ),
             
                  // PH
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        child: KdGaugeView(
                          baseGaugeColor: Colors.cyanAccent,
                          activeGaugeColor: Colors.red,
                    
                          key: globalKey, // Use UniqueKey() as key
                          minSpeed: 0,
                          maxSpeed: 14,
                          speed:
                              value, // Use the value variable to update the gauge
                          animate: true,
                        ),
                      ),
                    ),
                  ),
              
                  
                  SizedBox(
                    width: 150,
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Container(
                        child: KdGaugeView(
                          baseGaugeColor: Colors.cyanAccent,
                          activeGaugeColor: Colors.red,
                    
                          key: globalKey1, // Use UniqueKey() as key
                          minSpeed: 0,
                          maxSpeed: 14,
                          speed:
                              value, // Use the value variable to update the gauge
                          animate: true,
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        //อยู่ตรงนี้
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.member!.memFullname!,
                style: GoogleFonts.lemon(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              accountEmail: Text(
                widget.member!.memEmail!,
                style: GoogleFonts.lemon(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              currentAccountPicture:
                  FlutterLogo(), /////////////////////////////////////////////////////////////เปลี่ยนรูป
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home3UI()));
              },
              leading: Icon(
                Icons.data_usage,
                color: Colors.amber,
              ),
              title: Text(
                'Data Table',
                style: GoogleFonts.lemon(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TDSUI()));
              },
              leading: Icon(
                Icons.graphic_eq_sharp,
                color: Colors.amber,
              ),
              title: Text(
                'TDS Graph',
                style: GoogleFonts.lemon(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TempUI()));
              },
              leading: Icon(
                Icons.graphic_eq,
                color: Colors.amber,
              ),
              title: Text(
                'Temperature Graph',
                style: GoogleFonts.lemon(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PhUI()));
              },
              leading: Icon(
                Icons.graphic_eq,
                color: Colors.amber,
              ),
              title: Text(
                'Ph Graph',
                style: GoogleFonts.lemon(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapSample()));
              },
              leading: Icon(
                Icons.gps_fixed,
                color: Colors.amber,
              ),
              title: Text(
                'GPS',
                style: GoogleFonts.lemon(),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
