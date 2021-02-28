import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:vip_chat_app/widgets/customized_big_animated_button.dart';
import 'package:vip_chat_app/widgets/customized_text_button.dart';
import 'package:vip_chat_app/widgets/animated_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget getLogo() {
    if (kIsWeb) {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: TypewriterAnimatedTextKit(
          repeatForever: false,
          speed: Duration(milliseconds: 70),
          totalRepeatCount: 2,
          text: [
            ' YOURS',
            '  PRIVATE',
            '  CHAT',
          ],
          textStyle: TextStyle(
            fontSize: 40.0,
            fontFamily: kFontBungeeShade,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
      );
    } else {
      return ColorizeAnimatedTextKit(
        totalRepeatCount: 2,
        speed: Duration(milliseconds: 100),
        pause: Duration(milliseconds: 200),
        text: ['YOURS', 'PRIVATE', 'CHAT'],
        textStyle: TextStyle(
          fontSize: 50.0,
          fontFamily: 'BungeeShade',
          fontWeight: FontWeight.bold,
        ),
        colors: [
          Colors.black,
          Colors.black,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        textAlign: TextAlign.start,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: kBodyBackgroundContainerDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                getLogo(),
                SizedBox(
                  height: 40.0,
                ),
                CustomizedBigAnimatedButton(
                  title: 'Log In',
                  onTap: () {},
                  gradientColors: [
                    Colors.pink,
                    Colors.purpleAccent,
                  ],
                ),
                CustomizedBigAnimatedButton(
                  title: 'Register',
                  onTap: () {},
                  gradientColors: [
                    Colors.deepPurpleAccent,
                    Colors.teal,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('or'),
                ),
                CustomizedTextButton(
                  title: 'Try Demo Mode',
                  onPressed: () {},
                  fontFamily: kFontSourceSansProBold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
