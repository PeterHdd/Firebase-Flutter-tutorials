import 'package:firebase_google_sign_in_tutorial/screens/home_page.dart';
import 'package:firebase_google_sign_in_tutorial/screens/sign_in_page.dart';
import 'package:firebase_google_sign_in_tutorial/screens/welcome_page.dart';
import 'package:flutter/material.dart';




class Navigate {
  static Map<String, Widget Function(BuildContext)> routes =   {
    '/' : (context) => WelcomePage(),
    '/sign-in' : (context) => SignInPage(),
    '/home'  : (context) => HomePage()
  };
}
