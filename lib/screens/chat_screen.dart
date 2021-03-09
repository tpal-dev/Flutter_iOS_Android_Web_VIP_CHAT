import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vip_chat_app/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  User _loggedInUser;
  String _messageText;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        _loggedInUser = user;
        print(_loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream() async {
    await _firestore.collection('messages').snapshots().forEach((snapshot) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    });
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
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
                color: Colors.black,
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                Navigator.pushNamed(context, WelcomeScreen.id);
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
            MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: kFontSourceSansPro,
                        fontWeight: FontWeight.normal,
                      ),
                      onChanged: (value) {
                        _messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text': _messageText,
                        'sender': _loggedInUser.email,
                      });
                      messageTextController.clear();
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

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 150.0,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlue,
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          final messages = snapshot.data.docs;
          List<MessageContainer> messagesWidgets = [];
          for (var message in messages) {
            final messageText = message.data()['text'];
            final messageSender = message.data()['sender'];
            final messageWidget = MessageContainer(
              text: messageText,
              sender: messageSender,
            );
            messagesWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messagesWidgets,
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        } else {
          return Text('unknown problem with database');
        }
      },
    );
  }
}

class MessageContainer extends StatelessWidget {
  MessageContainer({this.text, this.sender});

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              sender,
              style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: kFontSourceSansPro,
                  color: Colors.white54),
            ),
          ),
          Container(
            constraints: BoxConstraints(minWidth: 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    fontFamily: kFontSourceSansPro,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
