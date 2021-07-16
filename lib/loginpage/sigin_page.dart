import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _toggleVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      resizeToAvoidBottomInset: false,
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0))),
        margin: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left:15),
              child: GestureDetector(
                child: Icon(
                  CupertinoIcons.clear_circled_solid,
                  color: Colors.lightBlue[200],
                  size: 35,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 60),
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.lightBlue[200],
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white, fontSize: 32.0,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        ),
                        hintText: "EMAIL",
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
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 5,bottom: 50),
            child: Column(
              children: <Widget>[
              TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.lightBlueAccent,
                ),
                hintText: "PASSWORD",
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
                suffixIcon: IconButton(
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    setState(() {
                      _toggleVisibility = !_toggleVisibility;
                    });
                  },
                  icon: _toggleVisibility
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              obscureText: _toggleVisibility,
            ),
          ],
        ),
      ),
            GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  margin: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 80),
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
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((FirebaseUser user) {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                    print(e);
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String userEmail;
  final String photoUrl;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.userEmail,
      this.photoUrl, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
