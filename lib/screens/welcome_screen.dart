import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_button/custom/anime_press_button.dart';
import 'package:vip_chat_app/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ColorizeAnimatedTextKit(
                totalRepeatCount: 1,
                speed: Duration(milliseconds: 300),
                pause: Duration(milliseconds: 300),
                text: ['YOURS', 'PRIVATE', 'CHAT'],
                textStyle: TextStyle(fontSize: 50.0, fontFamily: 'BungeeShade'),
                colors: [
                  Colors.black,
                  Colors.black,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 48.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: AnimePressButton(
                  duration: Duration(milliseconds: 100),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red,
                  onTap: () {},
                  wGradient: true,
                  gradientColors: [
                    Colors.pink,
                    Colors.purpleAccent,
                  ],
                  title: "Log In",
                  titleColor: Colors.black,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: AnimePressButton(
                  duration: Duration(milliseconds: 100),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red,
                  onTap: () {},
                  wGradient: true,
                  gradientColors: [
                    Colors.deepPurpleAccent,
                    Colors.teal,
                  ],
                  title: "Register",
                  titleColor: Colors.black,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
