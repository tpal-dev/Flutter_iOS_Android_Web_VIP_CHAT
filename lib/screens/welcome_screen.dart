import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:vip_chat_app/widgets/customized_big_animated_button.dart';
import 'package:vip_chat_app/widgets/customized_text_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:vip_chat_app/screens/login_screen.dart';
import 'package:vip_chat_app/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation curvedAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInQuad);
    animation = DecorationTween(
            begin: kBodyBackgroundContainerDecorationReverse,
            end: kBodyBackgroundContainerDecoration)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget getLogo() {
    if (kIsWeb) {
      return Padding(
        padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: TypewriterAnimatedTextKit(
          repeatForever: false,
          speed: Duration(milliseconds: 110),
          totalRepeatCount: 1,
          text: [
            ' YOURS',
            '  VIP',
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
        totalRepeatCount: 1,
        speed: Duration(milliseconds: 250),
        // pause: Duration(milliseconds: 300),
        text: ['YOURS', 'VIP', 'CHAT'],
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
        decoration: animation.value,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    width: curvedAnimation.value * 70.0,
                    height: curvedAnimation.value * 70.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/logo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                getLogo(),
                SizedBox(height: 40.0),
                CustomizedBigAnimatedButton(
                  title: 'Log In',
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  gradientColors: [
                    Colors.pink,
                    Colors.purpleAccent,
                  ],
                ),
                CustomizedBigAnimatedButton(
                  title: 'Register',
                  onTap: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  gradientColors: [
                    Colors.deepPurpleAccent,
                    Colors.teal,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('- OR -'),
                ),
                CustomizedTextButton(
                  title: 'TRY DEMO MODE',
                  onPressed: () {
                    print('demo button pressed');
                  },
                  fontFamily: kFontSourceSansPro,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
