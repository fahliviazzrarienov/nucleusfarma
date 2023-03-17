import 'package:flutter/material.dart';

import '../config/pallete.dart';
import '../detailpage/detailwpr.dart';

class RegistrationCustomer_Page extends StatefulWidget {
  const RegistrationCustomer_Page({Key? key}) : super(key: key);

  @override
  State<RegistrationCustomer_Page> createState() => _RegistrationCustomer_PageState();
}

class _RegistrationCustomer_PageState extends State<RegistrationCustomer_Page> {
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
                  _containerSales(status: 'progress'),
                  _containerSales(status: 'done'),
                  _containerSales(status: 'new'),
                  _containerSales(status: 'progress'),
                  _containerSales(status: 'done'),
                  _containerSales(status: 'new'),
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

}
