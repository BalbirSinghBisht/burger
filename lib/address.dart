import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/main.dart';

import 'account.dart';

class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/drawer': (BuildContext context) => new DrawerExample(),
        '/home': (BuildContext context) => new Home(),
      },
      home: AddressBar(),
    );
  }
}

class AddressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.lightGreen,
          title: Text('Add Address'),
          leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.of(context).pushNamed('/drawer'),
          )
      ),
      body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top:10),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "FULL NAME",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: "House no / Building name*",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Locality",
                                  labelStyle: TextStyle(
                                    color: Colors.cyanAccent,
                                  ),
                                  hintText: "Locality",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "City",
                                  labelStyle: TextStyle(
                                    color: Colors.cyanAccent,
                                  ),
                                  hintText: "City",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Pincode",
                                  labelStyle: TextStyle(
                                    color: Colors.cyanAccent,
                                  ),
                                  hintText: "Pincode",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ]
                  ),
                )
            ),
            Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 300,left: 20,right: 20),
                child: MaterialButton(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'ADD ADDRESS',
                        style: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/home'),
                ),
              ),
          ]),
    );
  }
}