import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:vip_chat_app/widgets/customized_icon_animated_button.dart';
import 'package:vip_chat_app/widgets/customized_medium_animated_button.dart';
import 'package:vip_chat_app/widgets/customized_white_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                hintText: 'Enter your nick',
                onChanged: (value) {},
              ),
              CustomizedWhiteTextField(
                hintText: 'Enter your e-mail',
                onChanged: (value) {},
              ),
              CustomizedWhiteTextField(
                hintText: 'Enter your password',
                onChanged: (value) {},
              ),
              CustomizedWhiteTextField(
                hintText: 'Repeat your password',
                onChanged: (value) {},
              ),
              SizedBox(
                height: 19.0,
              ),
              CustomizedMediumAnimatedButton(
                title: 'Register',
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
            ],
          ),
        ),
      ),
    );
  }
}
