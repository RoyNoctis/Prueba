import 'package:flutter/material.dart';
import 'package:flutter_practica_2/conversor.dart';
import 'package:flutter_practica_2/lista.dart';

class DashBoard extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Dashboard",
      home: MenuLateral(),
    );
  }
}

class MenuLateral extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MenuLateralState();
  }
}

class MenuLateralState extends State<MenuLateral>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Cine"),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green
              ),
              accountName: Text("Roy"),
              accountEmail: Text("13030393@itcelaya.edu.mx"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.airplay),
              title: Text("Peliculas"),
              trailing: Icon(Icons.account_box),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context)=>new Lista()
                  )
                );
              },
            ),
            ListTile(
              title: Text("Acerca de..."),
              trailing: Icon(Icons.account_box),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Conversor "),
              trailing: Icon(Icons.account_box),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context)=>new Conversor()
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
