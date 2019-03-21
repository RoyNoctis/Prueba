import 'package:flutter/material.dart';

class Conversor extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ConversorState();
  }
}

class ConversorState extends State<Conversor>
{

  final myControlelr = TextEditingController();
  final myController = TextEditingController();
  double Fgrados;
  double resultado;
  double Cgrados;

  @override
  void dispose() {
    // TODO: implement dispose
    myControlelr.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final buttonF = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        onPressed: (){
          Fgrados = double.parse(myControlelr.text);
          resultado = (Fgrados*1.8)+32;
          return showDialog(
              context: context,
            builder: (context){
                return AlertDialog(
                  content: Text("Grados Farenheit: ${resultado}"),
                );
            },
          );
        },
        child: Text("Convertir a °F"),
      ),
    );

    final buttonC = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
        ),
        onPressed: (){
          Cgrados = double.parse(myController.text);
          resultado = (Cgrados-32)*0.555;
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text("Grados Centigrados: ${resultado}"),
              );
            },
          );
        },
        child: Text("Convertir a °C"),
      ),
    );

    final txtC = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Grados °C",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
      controller: myControlelr,
    );

    final txtF = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Grados °F",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
      controller: myController,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor °C °F"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25.0,right: 25.0),
          children: <Widget>[
            txtC,
            SizedBox(height: 25,),
            buttonF,
            SizedBox(height: 25,),
            txtF,
            SizedBox(height: 25,),
            buttonC
          ],
        ),
      ),
    );
  }
}