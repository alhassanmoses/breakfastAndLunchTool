import 'package:flutter/material.dart';

// import './screens/welcomeScreen.dart';

import './theme.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lunch and Breakfast Tool',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      // initialRoute: WelcomeScreen.pageRoute,
      routes: routes,
    );
  }
}
