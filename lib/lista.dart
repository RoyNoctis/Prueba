import 'package:flutter/material.dart';
import 'package:flutter_practica_2/institucion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class Lista extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaState();
  }
}

class ListaState extends State<Lista>
{
  //List<String> lista = new List<String>();

  List<Institucion> list;

  final bottomMenu = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.blur_on,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo de lista"),
        ),
        bottomNavigationBar: bottomMenu,
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                padding: EdgeInsets.all(35.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: new NetworkImage(list[index].logoInstitucion),
                      radius: 50.0,
                    ),
                    Column(children: <Widget>[
                      Text(list[index].nomInstitucion),
                      Text(list[index].nomCortoInstitucion),
                    ],
                    ),
                  ],
                ),
              ),
            );
        }),
      ),
    );
  }
  
  Future<String> getData() async {
    String username = "intertecs";
    String password = "1nt3rt3c5";
    String basicAuth = 'Basic '+base64Encode(utf8.encode('$username:$password'));
    http.Response response = await http.get(
      Uri.encodeFull('http://ws.itcelaya.edu.mx:8080/intertecs/apirest/institucion/listado'),
      headers: {"authorization" : basicAuth}
    );

    if(response.statusCode == 200)
    {
        var data = json.decode(response.body);
        var rest = data["institucion"] as List;
        list = rest.map<Institucion>((json)=>Institucion.fromJSON(json)).toList();
    }

    setState(() {

    });

    //print(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });
  }
}