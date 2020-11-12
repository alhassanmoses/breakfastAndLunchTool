import 'package:flutter/material.dart';

import 'body.dart';

class SignUpCompletionScreen extends StatelessWidget {
  static String routeName = "/sign_up_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Text("Sign Up Success"),
      ),
      body: Body(),
    );
  }
}
