import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../sizeConfig.dart';

import 'signInScreen/signInScreen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcome_screen";

  // static var pageRoute;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Timer(Duration(milliseconds: 2500), () {
      Navigator.popAndPushNamed(context, SignInScreen.routeName);
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_1.png'), fit: BoxFit.cover),
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[300]],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
              ),
              Text(
                "Breakfast and Lunch Tool",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Camar',
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: 18.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: getProportionateScreenWidth(100),
                  backgroundImage: AssetImage("assets/images/food_welcome.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Loading',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 120,
              ),
              LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                width: 240.0,
                lineHeight: 4.0,
                animation: true,
                percent: 1.0,
                animationDuration: 2250,
                backgroundColor: Colors.grey,
                progressColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
