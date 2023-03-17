import 'package:flutter/material.dart';

class SalesVisit_Page extends StatefulWidget {
  const SalesVisit_Page({Key? key}) : super(key: key);

  @override
  State<SalesVisit_Page> createState() => _SalesVisit_PageState();
}

class _SalesVisit_PageState extends State<SalesVisit_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }

  _containerSalesvisit(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      width: 152,
      child: Column(
        children: [
          Container(width: 152, height: 100, decoration: BoxDecoration(
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
}
