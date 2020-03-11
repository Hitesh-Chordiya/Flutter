import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

//hello
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Attendance App",
      theme: new ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.teal),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 250));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(10.00),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
                stops: [
                  0,
                  0.5,
                  0.5
                ],
                colors: [
                  const Color.fromARGB(255, 52, 127, 228),
                  const Color.fromARGB(255, 89, 76, 192),
                  const Color.fromARGB(255, 255, 255, 255)
                ])),
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlutterLogo(
                  size: _iconAnimation.value * 100,
                ),
                new Container(
                  margin: new EdgeInsets.only(left: 20.00, right: 20.00),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.00),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                            offset: const Offset(3.0, 5.0)),
                      ]),
                  child: new Form(
                    autovalidate: true,
                    child: new Theme(
                        data: new ThemeData(
                            brightness: Brightness.light,
                            primarySwatch: Colors.blue,
                            inputDecorationTheme: new InputDecorationTheme(
                                helperStyle: new TextStyle(
                                    color: Colors.blue, fontSize: 10.00))),
                        child: Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                decoration: new InputDecoration(
                                    labelText: "Enter Email"),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new TextFormField(
                                decoration: new InputDecoration(
                                    labelText: "Enter Password"),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(top: 20.00)),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new MaterialButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100.00)),
                                      height: 60.00,
                                      minWidth: 200.00,
                                      splashColor: Colors.blue,
                                      onPressed: () => {},
                                      color: Color.fromARGB(255, 52, 127, 228),
                                      textColor: Colors.white,
                                      child: new Text("Sign In")),
                                  /*new MaterialButton(
                                      height: 50.00,
                                      minWidth: 80.00,
                                      splashColor: Colors.redAccent,
                                      onPressed: () => {},
                                      color: Colors.teal,
                                      textColor: Colors.white,
                                      child: new Text("Sign Up"))*/
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return new Container();
  }
}
