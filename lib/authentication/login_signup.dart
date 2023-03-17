import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nucleusfarma/config/pallete.dart';
import 'package:nucleusfarma/page/dashboard.dart';
import 'package:nucleusfarma/page/wprpage.dart';

import '../addpage/wpraddpage.dart';
import '../drawerother/navdemo.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    PaletteLogin.palatinate_blue,
                    PaletteLogin.yale_blue
                  ],
                      begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
                child: SingleChildScrollView(
                  child: Column(
              children: [
                  Center(child: Image.asset('asset/characters/opening_medicinebro.png', height: 300,),),
                  _card()
          ],
        ),
                ))
    );
  }

  _editText({required TextEditingController c, String? htext}){
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: PaletteLogin.palatinate_blue)
          ),
          labelText: htext
        ),
      ),
    );
  }

  _button({String? text}){
    return Center(
      child: InkWell(
        onTap: (){
          _navigation();
        },
        child: Container(
          decoration: BoxDecoration(
            color: PaletteLogin.yale_blue,
            borderRadius: BorderRadius.circular(20)
          ),
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.all(15),
            child: Text(text!,textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
        ),
      ),
    ));
  }

  _navigation(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationDrawerDemo(),));
  }

  _card(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
      margin: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(child: Image.asset('asset/characters/logo_nucleus.png', width:90, height: 30),),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              child: Text('Login with your account', textAlign: TextAlign.center, style: TextStyle(color: PaletteLogin.yale_blue, fontWeight: FontWeight.bold, fontSize: 22,)),
            ),
            SizedBox(height: 25),
            _editText(c: _email, htext: 'Email Address'),
            SizedBox(height: 10,),
            _editText(c: _email, htext: 'Password'),
            SizedBox(height: 15,),
            _button(text: 'Login'),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
