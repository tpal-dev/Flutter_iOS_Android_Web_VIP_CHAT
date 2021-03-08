import 'package:flutter/material.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vip_chat_app/screens/welcome_screen.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: null,
        actions: <Widget>[
          IconButton(
              color: Colors.black,
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut(); //logo
                Navigator.pop(context);
                Navigator.pushNamed(context, WelcomeScreen.id); // ut
              }),
        ],
        title: Text(
          '️Chat',
          style: TextStyle(
              fontFamily: kFontBungeeShade,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontFamily: kFontSourceSansPro,
                        fontWeight: FontWeight.normal,
                      ),
                      onChanged: (value) {
                        //user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //send
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
