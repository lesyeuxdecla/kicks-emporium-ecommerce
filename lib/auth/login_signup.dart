import 'package:flutter/material.dart';
import 'package:ecommerce_emporium/ui/pages/login.dart';
import 'package:ecommerce_emporium/ui/pages/signup.dart';

class LoginOrSignUp extends StatefulWidget {
  const LoginOrSignUp({super.key});

  @override
  State<LoginOrSignUp> createState() => _LoginOrSignUpState();
}

class _LoginOrSignUpState extends State<LoginOrSignUp> {
  //login page
  bool showLogin = true;

  //toggle between login and sign up pages
  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Login(onTap: togglePages);
    } else {
      return SignUp(onTap: togglePages);
    }
  }
}
