import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Material(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(300)),
        color: Colors.lightBlue[200],
          child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 70),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'GO',
                        style: TextStyle(color: Colors.lightBlue[200], fontSize: 84.0,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 200),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50,left: 60),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 70),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.white)]),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.lightBlue[200], fontSize: 20.0,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.white)]),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}