import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:vip_chat_app/widgets/customized_icon_animated_button.dart';
import 'package:vip_chat_app/widgets/customized_medium_animated_button.dart';
import 'package:vip_chat_app/widgets/customized_text_button.dart';
import 'package:vip_chat_app/widgets/customized_white_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: kBodyBackgroundContainerDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 70.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              CustomizedWhiteTextField(
                hintText: 'Enter your e-mail',
                onChanged: (value) {},
              ),
              CustomizedWhiteTextField(
                hintText: 'Enter your password',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 19.0,
              ),
              CustomizedMediumAnimatedButton(
                title: 'Log In',
                onTap: () {},
                gradientColors: [
                  Colors.pink,
                  Colors.purpleAccent,
                ],
              ),
              Text('or use'),
              CustomizedIconAnimatedButton(
                title: 'Facebook',
                onTap: () {},
                gradientColors: [
                  Colors.indigoAccent.shade400,
                  Colors.lightBlue,
                ],
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 19.0,
              ),
              CustomizedTextButton(
                title: 'Forgot Password?',
                onPressed: () {},
                fontFamily: kFontSourceSansPro,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
