import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/widgets/animated_button.dart';
import 'package:vip_chat_app/widgets/animated_icon_button.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.white, Colors.red]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 70.0,
                child: Image.asset('images/logo.png'),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 12.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    //user input.
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your nick',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 12.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    //user input.
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your e-mail',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 12.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    //user input.
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 12.0,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    //user input.
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Repeat your password',
                    hintStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              AnimatedButton(
                width: 200.0,
                height: 50.0,
                duration: Duration(milliseconds: 60),
                borderRadius: BorderRadius.circular(100.0),
                color: Colors.red,
                onTap: () {},
                wGradient: true,
                gradientColors: [
                  Colors.pink,
                  Colors.purpleAccent,
                ],
                title: "Register",
                titleColor: Colors.black,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text('or use'),
              ),
              AnimatedIconButton(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.black,
                ),
                width: 200.0,
                height: 50.0,
                duration: Duration(milliseconds: 60),
                borderRadius: BorderRadius.circular(100.0),
                color: Colors.red,
                onTap: () {},
                wGradient: true,
                gradientColors: [
                  Colors.indigoAccent.shade400,
                  Colors.lightBlue,
                ],
                title: "Facebook",
                titleColor: Colors.black,
                fontFamily: 'SourceSansPro',
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
