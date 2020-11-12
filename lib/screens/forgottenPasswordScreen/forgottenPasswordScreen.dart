import 'package:flutter/material.dart';

import './body.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  const ForgottenPasswordScreen({Key key}) : super(key: key);
  static const routeName = "/forgotten_password_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forgotten Password"),
        ),
        body: Body(),
      ),
    );
  }
}
