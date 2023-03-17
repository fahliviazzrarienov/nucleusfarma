import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nucleusfarma/config/pallete.dart';

import '../config/getx.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({Key? key}) : super(key: key);

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

class _Detail_PageState extends State<Detail_Page> {
  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(c.section.toString()), centerTitle: true, elevation: 0, actions: [
        Icon(Icons.edit,size: 20,)
      ]),
      body: Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(c.section.toString()=='Registration Customer'?0:20),
          child:
          c.section.toString()=='Journey'?
          SizedBox():
          c.section.toString()=='Registration Customer'?
          _registrationCustomer():
          _section(),
        ),
      ),
    );
  }

  _section(){
    return ListView(
      children: [
        c.section.toString()=='WPR'?
        _wpr():
        c.section.toString()=='Sales Breakdown'?
        _salesBreakdown():
        c.section.toString()=='Marketing Expense'?
        _marketingExpense():
        c.section.toString()=='Donasi'?
        _donasi():
        c.section.toString()=='Sales Visit'?
        SizedBox():
        SizedBox(),
        SizedBox(height: 24,),
        c.section.toString()!='Registration Customer'?
        _divider(c.section.toString()=='WPR'||c.section.toString()=='Marketing Expense'?'Attachment': c.section.toString()=='Sales Breakdown'||c.section.toString()=='Donasi'?'Product':'Photo'): SizedBox(),
        c.section.toString()!='Registration Customer'?
        _bottom() : SizedBox(),
      ],
    );
  }

  _bottom(){
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(child: Text('The ${c.section.toString()=='WPR'||c.section.toString()=='Marketing Expense'?'attachment': c.section.toString()=='Sales Breakdown'||c.section.toString()=='Donasi'?'product':'photo'} is still empty', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14)),width: double.infinity,),
        SizedBox(height: 20,),
        Divider(color: Colors.black,
          height: 2,),
        _button('Delete', Colors.redAccent)
      ],
    );
  }
  _divider(String text){
    return Container(
      child: Row(
        children: [
          Expanded(child: Divider(
            color: Colors.black,
            height: 2,
          )),
          SizedBox(width: 10,),
          Text(text, style: TextStyle(fontSize: 16, color: PaletteLogin.yale_blue)),
          SizedBox(width: 10,),
          Expanded(child: Divider(
            color: Colors.black,
            height: 2,
          )),
        ],
      ),
    );
  }
  _wpr(){
    return Column(
      children: [
        _text('No.', 'KSOXXXX.XXXX',80, ),
        SizedBox(height: 8,),
        _text('Costumer', 'Dr. Hendra Kurniawan',35, ),
        SizedBox(height: 8,),
        _text('Amount', 'Rp2.614.607,00',49, ),
        SizedBox(height: 8,),
        _text('Date', '24 Januari 2023',72, ),
        SizedBox(height: 8,),
        _text('Description', 'XXXXXXXXXXXXXXXXXX',24, ),
      ],
    );
  }
  _salesBreakdown(){
    return Column(
      children: [
        _text('Outlet', 'Apotek Sehat Bugar',62, ),
        SizedBox(height: 8,),
        _text('Period', 'Des 2022',59, ),
        SizedBox(height: 8,),
        _text('Qty', '100',81, ),
        SizedBox(height: 8,),
        _text('Qty Allocated', '50',9, ),
        SizedBox(height: 8,),
        _text('Balance', '50',48, ),
        SizedBox(height: 8,),
        _text('Status', 'In Progress',59 ),
      ],
    );
  }
  _marketingExpense(){
    return Column(
      children: [
        _text('No.', 'MEPXXXX.XXXX',80, ),
        SizedBox(height: 8,),
        _text('Type', 'Bensin',71, ),
        SizedBox(height: 8,),
        _text('Amount', 'Rp20.000,00',49, ),
        SizedBox(height: 8,),
        _text('Date', '24 Januari 2023',72, ),
        SizedBox(height: 8,),
        _text('Remark', 'XXXXXXXXXXXXXXXXXX',50, ),
      ],
    );
  }
  _donasi(){
    return Column(
      children: [
        _text('Thx No.', 'XXXXXXXXXXXX',50, ),
        SizedBox(height: 8,),
        _text('Outlet', 'Apotek Sehat Bugar',62, ),
        SizedBox(height: 8,),
        _text('Type', 'Bensin',71, ),
        SizedBox(height: 8,),
        _text('Date', '24 Januari 2023',72, ),
      ],
    );
  }
  _registrationCustomer(){
    return ListView(
      padding: EdgeInsets.only(top: 24, right: 20, left: 20, bottom: 32),
      scrollDirection: Axis.vertical,
      children: [
        _divider('Data Personal'),
        SizedBox(height: 16,),
        _text('Full Name', 'XXXX XXXX XXXX',33, ),
        SizedBox(height: 8,),
        _text('Short Name', 'XXXX',20, ),
        SizedBox(height: 8,),
        _text('Sex', 'Male',79, ),
        SizedBox(height: 8,),
        _text('Email', 'example@mail.com',66, ),
        SizedBox(height: 8,),
        _text('Phone', '+6285X XXXX XXXX',60, ),
        SizedBox(height: 8,),
        _text('Address', 'XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX XXXX',46, ),
        SizedBox(height: 8,),
        _text('City', 'XXXXXXXX',78, ),
        SizedBox(height: 8,),
        _text('Province', 'XXXXXXXX',43, ),
        SizedBox(height: 32,),
        _divider('Data User'),
        SizedBox(height: 16,),
        _text('Code', 'XXXX XXXX XXXX',68, ),
        SizedBox(height: 8,),
        _text('Group', 'XXXX XXXX XXXX',62, ),
        SizedBox(height: 8,),
        _text('Type', 'XXXX XXXX XXXX',71, ),
        SizedBox(height: 8,),
        _text('Category', 'XXXX XXXX XXXX',41, ),
        SizedBox(height: 8,),
        _text('Class', 'XXXX XXXX XXXX',66, ),
        SizedBox(height: 8,),
        _text('Balance', 'Rp.XXXX XXXX XXXX',48, ),
        SizedBox(height: 8,),
        _text('Target Call', 'XXXX XXXX XXXX',28, ),
        SizedBox(height: 32,),
        Divider(height: 1,color: Colors.black,),
        _button('Delete', Colors.redAccent),
      ],
    );
  }

  _text(String text, fill, double space){
    return Container(
      child: Row(
          children: [
            Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: PaletteLogin.yale_blue)),
            SizedBox(width: space,),
            Text(':', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),
            SizedBox(width: 8,),
            Container( width: 200,child:Text(fill, style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black)),)
          ]),
    );
  }

  _button(String text, Color color){
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              )
          ),
          onPressed: () {

          },
          child: Text(text)),
    );

  }
}
