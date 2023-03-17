import 'package:flutter/material.dart';

import '../config/pallete.dart';

class Journey_Page extends StatefulWidget {
  const Journey_Page({Key? key}) : super(key: key);

  @override
  State<Journey_Page> createState() => _Journey_PageState();
}

class _Journey_PageState extends State<Journey_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _top(),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: GridView.count(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.1),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  primary: false,
                  mainAxisSpacing: 15.0,
                    crossAxisSpacing: 10,
                  padding: EdgeInsets.symmetric(
                      vertical: 15),
                  crossAxisCount: 2,
                  children: [
                    _containerjourney(),
                    _containerjourney(),
                    _containerjourney(),
                    _containerjourney(),
                    _containerjourney(),
                    _containerjourney(),
                  ]
                ),
              )
            ),
          ]
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

  _containerjourney(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black38)
      ),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                width: 150,
                child: Text('19 Jan 2023',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: PaletteLogin.yale_blue),)),
            SizedBox(height: 3,),
            Container(
                width: 150,
                child: Text('REMARK', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)),
            SizedBox(height: 6,),
            Container(
                width: 150,
                child: Text('Lorem ipsum dolor sit amet consectetur. In enim pulvinar ultrices neque massa rutrum fermentum tellus. Eleifend ut mauris....',style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: PalleteDashboard.notcontent),) ),
            SizedBox(height: 12,),
            Container(
              width: 150,
              child: Container(
                margin: EdgeInsets.only(right: 60),
                decoration: BoxDecoration(
                  color: PalleteDashboard.urobilin,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: PalleteDashboard.background,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(4, 8), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                    margin: EdgeInsets.only(top: 4, bottom: 4, right: 18, left: 18),
                    child: Text('Area', style: TextStyle(fontSize: 12, color: PaletteLogin.yale_blue),)),
              ),
            ),
          ],
        ),
      ),
    );

  }

}
