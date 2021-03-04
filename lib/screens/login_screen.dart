import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:vip_chat_app/screens/registration_screen.dart';
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
  bool _rememberMe = false;

  Widget _buildRememberMeCheckbox() {
    return Row(
      children: <Widget>[
        Theme(
          data: ThemeData(
            unselectedWidgetColor: Colors.black45,
          ),
          child: Checkbox(
            value: _rememberMe,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                _rememberMe = value;
              });
            },
          ),
        ),
        Text(
          'Remember me',
          style: TextStyle(
            fontFamily: kFontSourceSansPro,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RegistrationScreen.id),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Don\'t have an Account? ',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
              SizedBox(height: 27.0),
              CustomizedWhiteTextField(
                icon: Icon(
                  Icons.email,
                  color: Colors.black45,
                ),
                hintText: 'Enter your e-mail',
                onChanged: (value) {},
              ),
              CustomizedWhiteTextField(
                icon: Icon(
                  Icons.lock,
                  color: Colors.black45,
                ),
                obscureText: true,
                hintText: 'Enter your password',
                onChanged: (value) {},
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25.0),
                      child: _buildRememberMeCheckbox(),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: CustomizedTextButton(
                        title: 'Forgot Password?',
                        onPressed: () {},
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
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
              SizedBox(height: 60.0),
              _buildSignUpBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
