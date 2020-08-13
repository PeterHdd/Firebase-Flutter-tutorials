import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';
import 'signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meet Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: IntroScreen(),);

  }
}

class IntroScreen extends StatefulWidget{


  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((res) {
      print(res);
      if (res != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: res.uid)),
        );
      }
      else
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignUp()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 5,
        title: new Text('Welcome To Meet up!',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: Image.asset('assets/images/dart.png',fit:BoxFit.scaleDown),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("flutter"),
        loaderColor: Colors.red
    );
  }
}