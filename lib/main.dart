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
      title: "Attendance Application",
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
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                    data: new ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.blue, fontSize: 20.00))),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            decoration:
                                new InputDecoration(labelText: "Enter Email"),
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
                          new MaterialButton(
                              height: 50.00,
                              minWidth: 80.00,
                              splashColor: Colors.redAccent,
                              onPressed: () => {},
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return new Container();
  }
}
