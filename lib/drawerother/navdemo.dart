import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nucleusfarma/addpage/wpraddpage.dart';
import 'package:nucleusfarma/page/dashboard.dart';
import 'package:nucleusfarma/page/donasi.dart';
import 'package:nucleusfarma/page/journey.dart';
import 'package:nucleusfarma/page/marketingexpense.dart';
import 'package:nucleusfarma/page/page.dart';
import 'package:nucleusfarma/page/registrationcustomer.dart';
import 'package:nucleusfarma/page/salesbreakdown.dart';
import 'package:nucleusfarma/page/salesvisit.dart';
import 'package:nucleusfarma/page/wprpage.dart';

import '../config/getx.dart';
import '../config/pallete.dart';
import 'firstpage.dart';


class NavigationDrawerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawerDemo> {
  int _selectedIndex = 0;
  Controller c = Get.put(Controller());

  final drawerItems = [
    new DrawerItem("Dashboard", Icons.dashboard),
    new DrawerItem("WPR", Icons.people),
    new DrawerItem("Sales Breakdown", Icons.sell),
    new DrawerItem("Marketing Expense", Icons.monetization_on),
    new DrawerItem("Donasi", Icons.handshake_rounded),
    new DrawerItem("Journey", Icons.map),
    new DrawerItem("Sales Visit", Icons.pin_drop),
    new DrawerItem("Registration Customer", Icons.person_add),
  ];

  _getDrawerItemScreen(int pos) {
    switch(pos){
      case 0:
        return Dashboard();
        break;
      default:
        return Front_Page();
        break;
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
      _getDrawerItemScreen(_selectedIndex);
    });
    Navigator.of(context).pop(); // close the drawer
//    Navigator.push(
//      context,
//      new MaterialPageRoute(
//        builder: (context) => _getDrawerItemScreen(_selectedIndex),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon,),
        title: new Text(
          d.title,
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, ),
        ),
        selected: i == _selectedIndex,
        onTap: () {
          _onSelectItem(i);
          c.section=d.title.toString().obs;
        },
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        backgroundColor: PaletteLogin.palatinate_blue,
        title: new Text(c.section.toString()),
        actions: [Icon(CupertinoIcons.person_circle,color: Colors.white,size: 30,)],
      ),
      floatingActionButton: c.section.toString()=='Dashboard'?SizedBox():FloatingActionButton(
        backgroundColor: PalleteDashboard.background,
          onPressed: () {
         _navigation();
          },
      child: Icon(Icons.add, size: 30,color: PaletteLogin.yale_blue,)),
      drawer: new Drawer(
        child: Container(
          color: Colors.white,
          child: new ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              // new UserAccountsDrawerHeader(
              //     accountName: new Text(
              //       "Yuvraj Pandey",
              //       style: new TextStyle(
              //           fontSize: 18.0, fontWeight: FontWeight.w500),
              //     ),
              //     accountEmail: new Text(
              //       "yuvrajn.pandey@gmail.com",
              //       style: new TextStyle(
              //           fontSize: 18.0, fontWeight: FontWeight.w500),
              //     ),
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [
              //             PaletteLogin.palatinate_blue,
              //             PaletteLogin.yale_blue
              //           ],
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight
              //       )
              //   ),
              //
              // ),
              DrawerHeader(
                  child: Container(

                child: Image.asset('asset/characters/logo_nucleus.png'),
              )),
              Container(
                color: Colors.white,
                  child: new Column(children: drawerOptions))
            ],
          ),
        ),
      ),
      body: _getDrawerItemScreen(_selectedIndex),
    );
  }

  _navigation(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WPR_AddPage(),));
  }

}

