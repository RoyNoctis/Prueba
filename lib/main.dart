import 'package:flutter/material.dart';
import 'package:flutter_practica_2/lista.dart';
import 'package:flutter_practica_2/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_practica_2/dashboard.dart';
void main() => runApp(
  MaterialApp(
    title: "SplashScreen",
    home: SplashScreen1(),
  )
);

class SplashScreen1 extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen1>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: DashBoard(),
      title: Text("Mi Aplicación :3"),
      image: Image.network('https://upload.wikimedia.org/wikipedia/commons/d/d4/Logo-TecNM-2017.png'),
      gradientBackground: new LinearGradient(colors: [Colors.white,Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}