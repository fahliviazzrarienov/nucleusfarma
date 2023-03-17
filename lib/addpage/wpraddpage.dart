import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../config/getx.dart';
import '../config/pallete.dart';

class WPR_AddPage extends StatefulWidget {
  const WPR_AddPage({Key? key}) : super(key: key);

  @override
  State<WPR_AddPage> createState() => _WPR_AddPageState();
}

class _WPR_AddPageState extends State<WPR_AddPage> {
  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add ${c.section.toString()}'), elevation: 0,),
      body: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 10,right: 10),
            child: ListView(
              children: [
                c.section.toString()=='WPR'?
                    _wprSection():
                c.section.toString()=='Sales Breakdown'?
                    _salesBreakdownSection():
                c.section.toString()=='Marketing Expense'?
                    _marketingExpenseSection():
                c.section.toString()=='Donasi'?
                    _donasiSection():
                c.section.toString()=='Journey'?
                _journeyeSection():
                c.section.toString()=='Sales Visit'?
                _salesVisitSection():
                c.section.toString()=='Registration Customer'?
                _registrationCustomerSection():
                SizedBox(),
                SizedBox(height: 24,),
                c.section.toString()!='Registration Customer'?
                _divider(c.section.toString()=='WPR'||c.section.toString()=='Marketing Expense'?'Attachment': c.section.toString()=='Sales Breakdown'||c.section.toString()=='Donasi'?'Product':'Photo'): SizedBox(),
                c.section.toString()!='Registration Customer'?
                _bottomSection(): SizedBox(),
              ],
            ),
          ),
        ),
    );
  }

  _bottomSection(){
    return Column(
      children: [
        SizedBox(height: 20,),
        Container(child: Text('The ${c.section.toString()=='WPR'||c.section.toString()=='Marketing Expense'?'attachment': c.section.toString()=='Sales Breakdown'||c.section.toString()=='Donasi'?'product':'photo'} is still empty', textAlign: TextAlign.center),width: double.infinity,),
        SizedBox(height: 20,),
        _button('Add ${c.section.toString()=='WPR'||c.section.toString()=='Marketing Expense'?'Attachment': c.section.toString()=='Sales Breakdown'||c.section.toString()=='Donasi'?'Product':'Photo'}', PalleteDashboard.notcontent, add: true),
        SizedBox(height: 10,),
        Divider(height: 2, color: PalleteDashboard.notcontent,),
        SizedBox(height: 10,),
        _button('Save', PaletteLogin.palatinate_blue),
        SizedBox(height: 80,),
      ],
    );
  }

  _wprSection(){
    return Column(
      children: [
        _textField(text: 'Customer' , search: true),
        _textField(text: 'Input'),
        _textField(text: 'Date', date: true),
        _textField(text: 'Customer'),
        _textField(text: 'Description'),
      ],
    );
  }
  _salesBreakdownSection(){
    return Column(
      children: [
        _textField(text: 'Outlet' , search: true),
        _textField(text: 'Period', date: true),
        _textField(text: 'Qty'),
        _textField(text: 'Qty Allocated'),
        _textField(text: 'Balance'),
      ],
    );
  }
  _marketingExpenseSection(){
    return Column(
      children: [
        _textField(text: 'Type' , search: true),
        _textField(text: 'Amount'),
        _textField(text: 'Date', date: true),
        _textField(text: 'Remark'),
      ],
    );
  }
  _donasiSection(){
    return Column(
      children: [
        _textField(text: 'Outlet' , search: true),
        _textField(text: 'Type' , search: true),
        _textField(text: 'Date', date: true),
      ],
    );
  }
  _journeyeSection(){
    return Column(
      children: [
        _textField(text: 'Visit Date', date: true),
        _textField(text: 'Area' , search: true),
        _textField(text: 'Remark'),
        _textField(text: 'Agenda'),
      ],
    );
  }
  _salesVisitSection(){
    return Column(
      children: [
        _textField(text: 'Visit Date', date: true),
        _textField(text: 'Area' , search: true),
        _textField(text: 'Outlet' , search: true),
        _textField(text: 'Remark'),
        _textField(text: 'Longitude'),
        _textField(text: 'Altitude'),
        _button('Get Current Location', PalleteDashboard.notcontent)
      ],
    );
  }
  _registrationCustomerSection(){
    return Column(
      children: [
        SizedBox(height: 24,),
        _divider('Data Personal'),
        SizedBox(height: 16,),
        _textField(text: 'Full Name'),
        _textField(text: 'Short Name'),
        _textField(text: 'Sex' , search: true),
        _textField(text: 'Email'),
        _textField(text: 'Phone'),
        _textField(text: 'Address'),
        _textField(text: 'City' , search: true),
        _textField(text: 'Province' , search: true),
        _divider('Data User'),
        _textField(text: 'Customer Code'),
        _textField(text: 'Customer Group' , search: true),
        _textField(text: 'Customer Type' , search: true),
        _textField(text: 'Customer Category' , search: true),
        _textField(text: 'Customer Class' , search: true),
        _textField(text: 'Balance'),
        _textField(text: 'Target Call'),
        _button('Save', PaletteLogin.palatinate_blue)
      ],
    );
  }
  
  _divider(String text){
    return Container(
      child: Row(
        children: [
          Expanded(child: Divider(
            color: Colors.black,
            height: 1,
          )),
          SizedBox(width: 10,),
          Text(text, style: TextStyle(fontSize: 16, color: PaletteLogin.yale_blue)),
          SizedBox(width: 10,),
          Expanded(child: Divider(
            color: Colors.black,
            height: 1,
          )),
        ],
      ),
    );
  }

  _bottomSheet(){
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      builder: (context) {
      return Container(
        child: new Column(
          children: [
            SizedBox(height: 20,),
            Container(child: Text(c.section.toString()=='WPR'||c.section.toString()=='Marketing Expense'?'Attachment': c.section.toString()=='Sales Breakdown'||c.section.toString()=='Donasi'?'Product':'Photo' , style: TextStyle(fontSize: 16, color: PaletteLogin.yale_blue)), width: double.infinity,margin: EdgeInsets.all(10)),
            c.section.toString()=='WPR'?
                _sheetWpr():
            c.section.toString()=='Sales Breakdown'?
                _sheetSalesBreakdown():
            c.section.toString()=='Marketing Expense'?
            _sheetMarketingExpense():
            c.section.toString()=='Donasi'?
            _sheetDonasi():
            _sheetPhoto(),
            c.section.toString()=='Donasi'? SizedBox() : SizedBox(height: 50,),
            _button('Add', PaletteLogin.yale_blue)
          ],
        ),
      );
    },);
  }

  _sheetWpr(){
    return Column(
      children: [
        _textField(text: 'Note'),
        _inputfile(),
      ],
    );
  }
  _sheetMarketingExpense(){
    return Column(
      children: [
        _textField(text: 'Note'),
        _inputfile(),
      ],
    );
  }
  _sheetPhoto(){
    return Column(
      children: [
        _textField(text: 'Note'),
        _inputfile(),
      ],
    );
  }
  _sheetSalesBreakdown(){
    return Column(
      children: [
        _textField(text: 'Product Name'),
        _textField(text: 'Quantity'),
      ],
    );
  }
  _sheetDonasi(){
    return Column(
      children: [
        _textField(text: 'Product Name'),
        _textField(text: 'Quantity'),
        _textField(text: 'Description'),
      ],
    );
  }

  _inputfile(){
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: 'Choose File...',
          hintStyle: TextStyle(color: Colors.black),
          enabled: false,
            prefixIcon: Container(
                margin:EdgeInsets.only(right: 20, left: 1),
                height:57,
                decoration: BoxDecoration(
                    color: Color(0xFFE7E0EC),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
                ),
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text('File',textAlign: TextAlign.center),)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );
  }

  _button(String text, Color color,{bool? add}){
    bool _add = add!=null ? add : false;
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
            _add == true?
                _bottomSheet():
                null;
          },
          child: Text(text)),
    );

  }

  _textField({String? text, bool? date, search}){
    bool _date = date!=null ? date : false;
    bool _search = search!=null? search : false;
    return  Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: _date ? Icon(Icons.calendar_month) : _search ? Icon(Icons.search): null,
            labelText: text,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black,),
              borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),
    );

  }
}
