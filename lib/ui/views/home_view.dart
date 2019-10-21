import 'package:basicarchicture/core/viewmodels/authntication_model.dart';
import 'package:basicarchicture/ui/shared/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthServiceModel>(
        model: AuthServiceModel(),
        builder: (
          context,
          model,
          child,
        ) =>
            Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: _getListUi(context, model)));
  }

  Widget _getListUi(BuildContext context, AuthServiceModel model) {
    var user = Provider.of<FirebaseUser>(context);

    return new Scaffold(
        appBar: AppBar(title: new Text('BUD')),
        drawer: Tooltip(
          child: new Drawer(
            child: Container(
              color: color,
              child: Center(
                child: new ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: new ListTile(
                          title: new Text(
                            "My Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'profile');
                          }),
                    ),
                    new ListTile(
                        title: new Text(
                          "Leaderboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'leaderboard');
                        }),
                    new ListTile(
                        title: new Text(
                          "Achievements",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, 'achievements');
                        }),
                    new ListTile(
                        title: new Text(
                          "Trip History",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {}),
                    new Divider(),
                    new ListTile(
                      title: new Text(
                        "Report a Problem",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    new ListTile(
                      title: new Text(
                        "About Us",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                    new ListTile(
                      title: new Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () async {
                        model.signOut();
                        Navigator.pushNamed(context, 'landing');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          message: "Open navigation menu",
        ),
        body: new Container());
  }
}
