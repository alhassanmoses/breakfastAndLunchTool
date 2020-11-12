import 'package:flutter/widgets.dart';

import 'screens/welcomeScreen.dart';
import 'screens/signInScreen/signInScreen.dart';
import 'screens/signUpScreen/signUpScreen.dart';
import 'screens/forgottenPasswordScreen/forgottenPasswordScreen.dart';
import 'screens/signInSuccessScreen/signInSuccessScreen.dart';
import 'screens/signUpCompletionScreen/signUpCompletionScreen.dart';
import 'screens/homeScreen/homeScreen.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (ctx) => WelcomeScreen(),
  WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
  SignInScreen.routeName: (ctx) => SignInScreen(),
  SignUpScreen.routeName: (ctx) => SignUpScreen(),
  ForgottenPasswordScreen.routeName: (ctx) => ForgottenPasswordScreen(),
  SignInSuccessScreen.routeName: (ctx) => SignInSuccessScreen(),
  SignUpCompletionScreen.routeName: (ctx) => SignUpCompletionScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
};
