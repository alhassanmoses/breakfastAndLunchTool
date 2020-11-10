import 'package:flutter/material.dart';
import 'screens/welcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunch and Breakfast Tool',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}


