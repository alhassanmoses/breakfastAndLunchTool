import 'package:flutter/material.dart';

import './homeScreen.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home"),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
