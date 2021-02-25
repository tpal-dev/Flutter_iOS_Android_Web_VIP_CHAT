import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vip_chat_app/widgets/anime_button.dart';
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
        padding: const EdgeInsets.only(top: 5.0, bottom: 40.0),
        child: TypewriterAnimatedTextKit(
          repeatForever: false,
          speed: Duration(milliseconds: 70),
          totalRepeatCount: 2,
          text: [
            ' YOURS',
            '  PRIVATE',
            '  CHAT',
          ],
          textStyle: TextStyle(fontSize: 40.0, fontFamily: 'BungeeShade'),
          textAlign: TextAlign.start,
        ),
        // child: Text('CHAT',
        //     style: TextStyle(
        //         fontSize: 50.0,
        //         fontFamily: 'BungeeShade',
        //         color: Colors.black)),
      );
    } else {
      return ColorizeAnimatedTextKit(
        totalRepeatCount: 2,
        speed: Duration(milliseconds: 100),
        pause: Duration(milliseconds: 200),
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.white, Colors.red]),
        ),
        child: Padding(
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
                getLogo(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: AnimePressButton(
                    duration: Duration(milliseconds: 60),
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
                    duration: Duration(milliseconds: 60),
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
      ),
    );
  }
}
