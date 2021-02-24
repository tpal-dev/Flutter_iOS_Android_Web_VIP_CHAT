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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'CHAT',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'BungeeShade'),
                ),
              ],
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
    );
  }
}
