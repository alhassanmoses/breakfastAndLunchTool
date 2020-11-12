import 'package:flutter/material.dart';

import '../screens/signUpScreen/signUpScreen.dart';

import '../constants.dart';
import '../sizeConfig.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(fontSize: getProportionateScreenWidth(16)),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  color: kPrimaryColor),
            ),
          )
        ],
      ),
    );
  }
}
