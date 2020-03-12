import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String _email;
  String _password;

  String errorMessage;
  String successMessage;

  void performLogin() {
    final snackBar =
        new SnackBar(content: new Text("Email:$_email, \nPassword:$_password"));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

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
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: new Container(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.00),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  tileMode: TileMode.clamp,
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
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image(
                    image: new AssetImage("assets/college_logo.png"),
                    alignment: Alignment.topCenter,
                    height: 200,
                    width: 150,
                  ),
                  new Card(
                    margin: new EdgeInsets.only(
                        left: 25.00, right: 25.00, bottom: 20.00, top: 25.00),
                    elevation: 10.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: new Form(
                        key: formKey,
                        autovalidate: true,
                        child: new Theme(
                            data: new ThemeData(
                                brightness: Brightness.light,
                                primarySwatch: Colors.blue,
                                inputDecorationTheme: new InputDecorationTheme(
                                    labelStyle: new TextStyle(
                                        color: Colors.blue, fontSize: 15.00))),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontFamily: 'BalooChettan2',
                                      color: Colors.black54,
                                      fontSize: 40.00,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0),
                                ),
                                new Padding(padding: EdgeInsets.all(20.00)),
                                new TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'BalooChettan2',
                                        color: Colors.black54,
                                        fontSize: 20.00),
                                    decoration: new InputDecoration(
                                        labelText: "Enter Email",
                                        labelStyle: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 15.00)),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: validateEmail,
                                    onChanged: (val) {
                                      setState(() => _email = val);
                                    }),
                                new TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'BalooChettan2',
                                        color: Colors.black54,
                                        fontSize: 20.00),
                                    decoration: new InputDecoration(
                                        labelText: "Enter Password",
                                        labelStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            fontSize: 15.00)),
                                    keyboardType: TextInputType.text,
                                    obscureText: true,
                                    validator: validatePassword,
                                    onChanged: (val) {
                                      setState(() => _password = val);
                                    }),
                                new Padding(
                                    padding: const EdgeInsets.only(top: 30.00)),
                                new RaisedButton(
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.00)),
                                    splashColor: Colors.blue,
                                    onPressed: () async {
                                      if (formKey.currentState.validate()) {
                                        formKey.currentState.save();
                                        signIn(_email, _password).then((user) {
                                          if (user != null) {
                                            print("Logged in Successfully");
                                            setState(() {
                                              successMessage =
                                                  "Logged in $user";
                                            });
                                          } else {
                                            print("Error logging in");
                                          }
                                        });
                                      }
                                    },
                                    elevation: 2.0,
                                    padding: EdgeInsets.only(
                                        left: 50.00,
                                        right: 50.00,
                                        top: 15.00,
                                        bottom: 15.00),
                                    color: Color.fromARGB(255, 52, 127, 228),
                                    textColor: Colors.white,
                                    child: new Text("Sign In",
                                        textAlign: TextAlign.center)),
                                new Padding(
                                    padding: EdgeInsets.only(bottom: 15.00))
                              ],
                            )),
                      ),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20.00)),
                  new MaterialButton(
                    onPressed: () => {},
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.00)),
                    child: new Text("Forgot Password?",
                        style: TextStyle(
                            fontFamily: 'BalooChettan2',
                            color: Colors.black54,
                            fontSize: 20.00)),
                  ),
                  new MaterialButton(
                    onPressed: () => {},
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.00)),
                    child: new Text("Sign Up",
                        style: TextStyle(
                            fontFamily: 'BalooChettan2',
                            color: Colors.black54,
                            fontSize: 20.00)),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      return user;
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Invalid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password too short';
    }
    return null;
  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_USER_NOT_FOUND':
        setState(() {
          errorMessage = 'User Not Found!!!';
        });
        break;
      case 'ERROR_WRONG_PASSWORD':
        setState(() {
          errorMessage = 'Wrong Password!!!';
        });
        break;
    }
  }
}
