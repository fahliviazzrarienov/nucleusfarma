import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nucleusfarma/detailpage/detailwpr.dart';

import '../config/getx.dart';
import '../config/pallete.dart';

class Front_Page extends StatefulWidget {
  const Front_Page({Key? key}) : super(key: key);

  @override
  State<Front_Page> createState() => _Front_PageState();
}

class _Front_PageState extends State<Front_Page> {

  Controller c = Get.put(Controller());
  List<String> status = ['progress', 'new', 'done'];
  List<String> status_cus = ['Aktif', 'Nonaktif'];
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _top(),
            Expanded(
                child: c.section.toString()=='Journey' ||c.section.toString()=='Sales Visit'?
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                          vertical: c.section.toString()=='Journey'?10:20),
                        itemCount: 100,
                        itemBuilder: (context, index) => c.section=='Journey'?_containerjourney():c.section.toString()=='Sales Visit'?_containerSalesvisit():SizedBox(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 10,
                          childAspectRatio:c.section.toString()=='Journey'? MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.3):MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.6),
                        ),
                    ):
                ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return c.section.toString()=='WPR'?
                    _containerWpr():
                    c.section.toString()=='Sales Breakdown'?
                    _containerSales(status: status[random.nextInt(status.length)]):
                    c.section.toString()=='Marketing Expense'?
                    _containerMarket(status: 'approval'):
                    c.section.toString()=='Donasi'?
                    _containerDonasi():
                    c.section.toString()=='Registration Customer'?
                    _containerRegisterCustomer(status: status_cus[random.nextInt(status_cus.length)]):
                    SizedBox();
                  },
                )
            ),
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
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          iconColor: Colors.white,
                          hintText: "Cari...",
                          prefixIcon: Icon(Icons.search,color: Colors.white),
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
                    child: Icon(c.section.toString()=='WPR'?Icons.calendar_month:Icons.filter_alt, size: 26, color: Colors.white,),
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

 // TODO:CONTAINER WPR
  _containerWpr(){
    return InkWell(
      onTap: (){
        // _navigation();
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
                        Container(width: 220,child: Text('KSOXXXX.XXXX',style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: PaletteLogin.yale_blue),)),
                        SizedBox(height: 3,),
                        Container(width: 220,child: Text('Dr. Hendra Kurniawan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),)),
                        SizedBox(height: 3,),
                        Container(width: 220,child:Text('Rp2.614.607,00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),),)
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

 // TODO:CONTAINER SALES BREAKDOWN
  _containerSales({ String? status}){
    Color? firstcolor, secondcolor;
    if(status=='progress') {
      firstcolor = PaletteLogin.palatinate_blue;
      secondcolor = PaletteLogin.yale_blue;
    }else if(status=='new'){
      firstcolor = PalleteDashboard.urobilin;
      secondcolor = PalleteDashboard.smashed_pumpkin;
    }else if(status == 'done'){
      firstcolor =PalleteDashboard.emerald;
      secondcolor=PalleteDashboard.spanish_green;
    }else{
      firstcolor=Colors.black;
      secondcolor= Colors.grey;
    }
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_Page(),));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: firstcolor, width: 1.5),
              borderRadius: BorderRadius.circular(25),
              color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 12),
                    child: Container(
                      width: 8,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                firstcolor!,
                                secondcolor!
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                          )
                      ),),),
                  Container(
                    child: Column(
                      children: [
                        Container(width: 250,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Jan 2022',style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: PalleteDashboard.notcontent),),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: firstcolor
                              ),
                              child: Container(
                                  margin: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                                  child: Text(status.toString(),style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: status=='progress'?Colors.white: Colors.black87),)),)
                          ],
                        )),
                        SizedBox(height: 4,),
                        Container(width: 250,child: Text('CATURWARGA MATARAM, AP', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)),
                        SizedBox(height: 4,),
                        Container(width: 250,child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Qty: 10',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),),
                            Text('Qty Allocated: 10',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),) ,
                            Text('Balance: 0',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),)
                          ],
                        ))
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

 // TODO:CONTAINER Marketing Expense
  _containerMarket({ String? status}){
    Color? firstcolor, secondcolor;
    if(status=='approval') {
      firstcolor = PaletteLogin.palatinate_blue;
      secondcolor = PaletteLogin.yale_blue;
    }else{
      firstcolor=Colors.black;
      secondcolor= Colors.grey;
    }
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_Page(),));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow:  [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(25),
              color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 12),
                    child: Container(
                      width: 8,
                      height: 70,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                firstcolor!,
                                secondcolor!
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                          )
                      ),),),
                  Container(
                    child: Column(
                      children: [
                        Container(width: 250,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Jan 2022',style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: PalleteDashboard.notcontent),),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: firstcolor
                              ),
                              child: Container(
                                  margin: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                                  child: Text(status.toString(),style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal, color: Colors.white),)),)
                          ],
                        )),
                        SizedBox(height: 4,),
                        Container(width: 250,child: Text('MEPXXXX.XXXX', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)),
                        SizedBox(height: 4,),
                        Container(width: 250,child: Text('BENSIN', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: PalleteDashboard.notcontent),)),
                        SizedBox(height: 4,),
                        Container(width: 250,child:Text('Rp2.614.607,00', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: PalleteDashboard.notcontent),),)
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  // TODO:CONTAINER Donasi
  _containerDonasi(){
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

  // TODO:CONTAINER Donasi
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
            SizedBox(height: 10,),
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

  // TODO:CONTAINER Donasi
  _containerSalesvisit(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      width: 152,
      child: Column(
        children: [
          Container(width: double.infinity, height: 100, decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
          ),child: Icon(Icons.photo),),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 16, left: 6, right: 42),
            child: Column(
              children: [
                Container(child: Text('19 Jan 2023', style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal, color: Colors.grey)),width: double.infinity,),
                SizedBox(height: 2,),
                Container(child: Text('CATURWARGA MATARAM, AP', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.black)),width: double.infinity,)
              ],
            ),)
        ],
      ),);
  }

  // TODO:CONTAINER SALES BREAKDOWN
  _containerRegisterCustomer({ String? status}){
    Color? firstcolor, secondcolor;
    if(status=='Aktif') {
      firstcolor = PaletteLogin.palatinate_blue;
      secondcolor = PaletteLogin.yale_blue;
    }else if(status=='Nonaktif'){
      firstcolor = PalleteDashboard.urobilin;
      secondcolor = PalleteDashboard.smashed_pumpkin;
    }else{
      firstcolor=Colors.black;
      secondcolor= Colors.grey;
    }
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_Page(),));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: firstcolor, width: 1.5),
              borderRadius: BorderRadius.circular(25),
              color: Colors.white),
          child: Container(
            margin: EdgeInsets.all(15),
            child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 12),
                    child: Container(
                      width: 8,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                firstcolor!,
                                secondcolor!
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                          )
                      ),),),
                  Container(
                    child: Column(
                      children: [
                        Container(width: 250,child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('XXX-XXXXXXXX',style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal, color: PalleteDashboard.notcontent),),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: firstcolor
                              ),
                              child: Container(
                                  margin: EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                                  child: Text(status.toString(),style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: status=='progress'?Colors.white: Colors.black87),)),)
                          ],
                        )),
                        SizedBox(height: 4,),
                        Container(width: 250,child: Text('dr. Kureha', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),)),
                        SizedBox(height: 4,),
                        Container(width: 250,
                            child:
                            Text('Dokter',style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey),) ,
                        )
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
