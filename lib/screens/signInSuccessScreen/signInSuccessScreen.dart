import 'package:flutter/material.dart';

import 'body.dart';

class SignInSuccessScreen extends StatelessWidget {
  static String routeName = "/sign_in_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text("Sign In Success"),
      ),
      body: Body(),
    );
  }
}
