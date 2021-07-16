import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/address.dart';

class DrawerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/Address': (BuildContext context) => new Address(),
      },
      home: AppBarBack(),
    );
  }
}

class AppBarBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.lightGreen,
          title: Text('Account'),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() {
              Navigator.pushNamed(context, '/home');
            }
          )
      ),
      body: ListView(
              children: <Widget>[
                Container(
                padding: EdgeInsets.only(top:50,bottom: 40,left:10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(left: 10,right: 18,bottom: 10),
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                      image: NetworkImage(
                      'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png'),
                      fit: BoxFit.cover),
                      ),
                      ),
                      Text(
                      '9489303930',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black54,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.create_sharp,
                                    color: Colors.black54,
                                  ),
                                  hintText: "Your Name",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black54,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.create_sharp,
                                    color: Colors.black54,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.cyanAccent)]),
                          child: Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'ADD ADDRESS',
                                    style: TextStyle(color: Colors.cyanAccent, fontSize: 20.0,fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/Address');
                              },
                            ),
                          ),
                        ),
                    ]
                    ),
                  )
                ),
              ]),
    );
  }
}