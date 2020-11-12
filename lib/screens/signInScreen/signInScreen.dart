import 'package:flutter/material.dart';

import 'body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  static const routeName = "sign_in_screen";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign In"),
        ),
        body: Body(),
      ),
    );
  }
}
