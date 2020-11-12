import 'dart:ui';
import 'package:flutter/material.dart';

import '../../components/customSuffixIcon.dart';
import '../../components/formErrorMessages.dart';
import '../../components/defaultButton.dart';
import '../../screens/forgottenPasswordScreen/forgottenPasswordScreen.dart';
import '../signInSuccessScreen/signInSuccessScreen.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgottenPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormErrorMessages(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, SignInSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email/staff-id",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}

// import '../widgets/customTextField.dart';
// import 'signUpScreen.dart';

// class LoginScreen extends StatelessWidget {
//   static const pageRoute = "/login-screen";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/images/bg_1.png'), fit: BoxFit.cover),
//           gradient: LinearGradient(
//               colors: [Colors.blue[400], Colors.blue],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter),
//         ),
//         child: Center(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 180,
//               ),
//               Row(
//                 children: <Widget>[
//                   SizedBox(
//                     width: 40,
//                   ),
//                   Text(
//                     'Welcome',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 35),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: <Widget>[
//                   SizedBox(
//                     width: 40,
//                   ),
//                   Text(
//                     'Sign in with your account',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 65,
//               ),
//               CustomTextField(
//                 issecured: false,
//                 hint: '    Email/Phone/StaffID...',
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               CustomTextField(
//                 hint: '   Password...',
//                 issecured: true,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 40,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 25, right: 25),
//                 child: ButtonTheme(
//                     buttonColor: Colors.white,
//                     minWidth: MediaQuery.of(context).size.width,
//                     height: 55,
//                     child: RaisedButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Log in',
//                         style: TextStyle(color: Colors.grey, fontSize: 22),
//                       ),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25)),
//                     )),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Text(
//                   'OR',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               // Container(
//               //   //TODO: edit this so the screen centeres and removes the social icons
//               //   height: 60,
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.center,
//               //     children: <Widget>[
//               //       Image(image: AssetImage('images/fb.png')),
//               //       SizedBox(
//               //         width: 20,
//               //       ),
//               //       Image(image: AssetImage('images/google.png'))
//               //     ],
//               //   ),
//               // ),
//               SizedBox(
//                 height: 25,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "Don't Have an Accout ?",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, SignUpScreen.pageRoute);
//                     },
//                     child: Text(
//                       'Sign up',
//                       style: TextStyle(
//                           decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
