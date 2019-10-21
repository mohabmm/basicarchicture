import 'package:basicarchicture/core/viewmodels/authntication_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_widget.dart';

class Profile extends StatelessWidget {
  String newNickName;
  String oldorcurrentimage;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);
    return BaseWidget<AuthServiceModel>(
        model: AuthServiceModel(),
        onModelReady: (model) {
          // on model ready replaces initstate though it needs some logic work
          model.readImages(context, newNickName, oldorcurrentimage);
        },
        builder: (
          context,
          model,
          child,
        ) =>
            Scaffold(
                appBar: new AppBar(
                    backgroundColor: Colors.lightBlueAccent,
                    title: new Text(user.displayName)),
                body: _getListUi(model, context)));
  }

  Widget _getListUi(AuthServiceModel model, BuildContext context) {
    return Center(
      child: FlatButton(
          child: Text('logout'),
          color: Colors.red,
          onPressed: () async {
            await model.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, 'landing', (route) => false);
          }),
    );
  }
}
