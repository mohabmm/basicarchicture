import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback onSignedIn;

  const LandingPage({Key key, this.onSignedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getListUi(
        context,
      ),
    );
  }
}

Widget _getListUi(
  BuildContext context,
) {
  final signUpColor = const Color(0xFF3d3d3d);
  return Container(
    decoration: new BoxDecoration(
      image: new DecorationImage(
        image: new AssetImage("assets/login-bg.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: new Padding(
      padding: const EdgeInsets.all(20.00),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 60.0),
            child: new Text(
              "It's dangerous to go alone,grab a bud ",
              key: Key("signintext"),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
          new RaisedButton(
            key: Key("sparta"),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.lightBlueAccent,
            child: new Text(
              "Log in with email and password",
            ),
            onPressed: () {
//              Navigator.pushNamed(context, 'signinformem');
            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.00),
          ),
          new RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            child: new Text(
              "Sign up with email and password ",
              style: TextStyle(color: signUpColor),
            ),
            onPressed: () {
//              Navigator.pushNamed(context, 'signupform');
            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.00),
          ),
        ],
      ),
    ),
  );
}
