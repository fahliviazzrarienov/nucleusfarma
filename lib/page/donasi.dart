import 'package:flutter/material.dart';
import 'package:nucleusfarma/detailpage/detailwpr.dart';
import '../config/pallete.dart';

class Donasi_Page extends StatefulWidget {
  const Donasi_Page({Key? key}) : super(key: key);

  @override
  State<Donasi_Page> createState() => _Donasi_PageState();
}

class _Donasi_PageState extends State<Donasi_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _top(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                children: [
                  _containerWpr(),
                  _containerWpr(),
                  _containerWpr(),
                  _containerWpr(),
                  _containerWpr(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _top(){
    return  Container(
      // margin: EdgeInsets.only(top: 5),
        color: PaletteLogin.palatinate_blue,
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextField(
                        onChanged: (value) {
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          iconColor: Colors.white,
                          hintText: "Cari...",
                          prefixIcon: Icon(Icons.search),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 2.0),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      ),
                    ),),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Icon(Icons.arrow_drop_up_outlined, size: 20, color: Colors.white,),
                        Text('AZ',  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_drop_down, size: 20, color: Colors.white,)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(Icons.filter_alt, size: 26, color: Colors.white,),
                  )
                ],
              ),
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   children: [
              //     _containerWpr(),
              //     _containerWpr(),
              //     _containerWpr(),
              //     _containerWpr(),
              //     _containerWpr(),
              //   ],
              // )
            ],
          ),
        )
    );
  }

  _containerWpr(){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_Page(),));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: PalleteDashboard.background,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(4, 8), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(5),
            child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PalleteDashboard.urobilin,
                    ),
                    margin: EdgeInsets.all(10),
                    child: Container(
                        width: 64,
                        height: 64,
                        child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('10', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PaletteLogin.yale_blue),),
                                SizedBox(height: 10,),
                                Text('Jan', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PaletteLogin.yale_blue),),
                              ],
                            ))),),
                  Container(
                    child: Column(
                      children: [
                        Container(width: 220,child: Text('Donasi',style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: PalleteDashboard.urobilin),)),
                        SizedBox(height: 3,),
                        Container(width: 220,child: Text('CATURWARGA MATARAM, AP', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)),
                        SizedBox(height: 3,),
                        Container(width: 220,child:Text('Description', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),),)
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

}
