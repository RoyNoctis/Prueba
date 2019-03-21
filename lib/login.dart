import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login>
{


  @override
  Widget build(BuildContext context) {
    Future<String> getData() async {
      http.Response response = await http.get(
          Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
          headers: { "Accept" : "application/json"}
      );

      //print(response.body);

      List data = json.decode(response.body);
      print(response.body);

    }
    //Implementación logo
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 50.0,
        child: Image.asset("images/lynx.png"),
      ),
    );
    //Implementación caja Email
    final txtEmail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Introduce el Email",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );
    //Implementacion caja Password
    final txtPass = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Introduce Password",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
        onPressed: getData,
        padding: EdgeInsets.all(12.0),
        color: Colors.white,
        child: Text("Entrar", style: TextStyle(color: Colors.black),),
      ),
    );
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25.0,right: 25.0),
          children: <Widget>[
            logo,
            SizedBox(height: 25),
            txtEmail,
            SizedBox(height: 25),
            txtPass,
            SizedBox(height: 25,),
            loginButton
          ],
        ),
      ),
    );
  }
}