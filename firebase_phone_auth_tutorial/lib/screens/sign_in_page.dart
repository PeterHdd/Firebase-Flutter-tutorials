import 'package:firebase_phone_auth_tutorial/components/phone_auth_form.dart';
import 'package:firebase_phone_auth_tutorial/components/sign_in_button.dart';
import 'package:firebase_phone_auth_tutorial/utils/constants.dart';
import 'package:firebase_phone_auth_tutorial/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(color: Constants.kBorderColor, width: 3.0));
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Constants.kPrimaryColor,
        body: Center(
            child:
                SingleChildScrollView(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/images/sign-in.png"),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: Constants.textSignInTitle,
                      style: TextStyle(
                        color: Constants.kBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      )),
              ])),
          SizedBox(height: size.height * 0.01),
          Text(
            Constants.textSmallSignIn,
            style: TextStyle(color: Constants.kDarkGreyColor),
          ),
          SignInButton(
            loginType: LoginType.Google,
            faIcon: FaIcon(FontAwesomeIcons.google),
            textLabel: Constants.textSignInGoogle,
          ),
          SignInButton(
            loginType: LoginType.Twitter,
            faIcon: FaIcon(FontAwesomeIcons.twitter),
            textLabel: Constants.textSignInTwitter,
          ),
          SignInButton(
              loginType: LoginType.Facebook,
              faIcon: FaIcon(FontAwesomeIcons.facebook),
              textLabel: Constants.textSignInFacebook),
          buildRowDivider(size: size),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.02)),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: Constants.textAcc,
                      style: TextStyle(
                        color: Constants.kDarkGreyColor,
                      )),
                  TextSpan(
                      text: Constants.textSignUp,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.kDarkBlueColor,
                      )),
              ])),
        ]),
                )));
  }

  Widget buildRowDivider({required Size size}) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(children: <Widget>[
        Expanded(child: Divider(color: Constants.kDarkGreyColor)),
        Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "Or",
              style: TextStyle(color: Constants.kDarkGreyColor),
            )),
        Expanded(child: Divider(color: Constants.kDarkGreyColor)),
      ]),
    );
  }
}
