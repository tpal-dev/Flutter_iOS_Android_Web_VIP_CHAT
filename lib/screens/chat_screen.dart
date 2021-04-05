import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vip_chat_app/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

final _firestore = FirebaseFirestore.instance;
User _loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // int _selectedBottomBarItemPosition = 0;

  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  DateTime _now;
  DateTime _date;
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
      }
    } catch (e) {
      print(e);
    }
  }

  void sendMessage() {
    _now = DateTime.now();
    _date = DateTime(_now.year, _now.month, _now.day, _now.hour, _now.minute);
    _firestore.collection('messages').add({
      'text': _messageText,
      'sender': _loggedInUser.email,
      // 'time': FieldValue.serverTimestamp(),
      'time': _date.toString().substring(0, 16),
    });
    messageTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
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
                      textInputAction: TextInputAction.search,
                      controller: messageTextController,
                      decoration: kMessageTextFieldDecoration,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: kFontSourceSansPro,
                        fontWeight: FontWeight.normal,
                      ),
                      onChanged: (value) {
                        _messageText = value;
                      },
                      onEditingComplete: () {
                        sendMessage();
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      sendMessage();
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
      // bottomNavigationBar: SnakeNavigationBar.color(
      //   behaviour: SnakeBarBehaviour.pinned,
      //   snakeShape: SnakeShape.circle,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(25),
      //       topRight: Radius.circular(25),
      //     ),
      //   ),
      //   padding: EdgeInsets.zero,
      //
      //   ///configuration for SnakeNavigationBar.color
      //   snakeViewColor: Colors.lightBlueAccent,
      //   selectedItemColor: SnakeShape.circle == SnakeShape.indicator
      //       ? Colors.lightBlueAccent
      //       : null,
      //   unselectedItemColor: Colors.black26,
      //
      //   showUnselectedLabels: false,
      //   showSelectedLabels: false,
      //
      //   currentIndex: _selectedBottomBarItemPosition,
      //   onTap: (index) =>
      //       setState(() => _selectedBottomBarItemPosition = index),
      //   items: [
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.group), label: 'tickets'),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.animation), label: 'tickets'),
      //     const BottomNavigationBarItem(
      //         icon: Icon(Icons.list), label: 'tickets'),
      //   ],
      //   selectedLabelStyle: const TextStyle(fontSize: 14),
      //   unselectedLabelStyle: const TextStyle(fontSize: 10),
      // ),
    );
  }
}

class MessageContainer extends StatelessWidget {
  MessageContainer({this.text, this.sender, this.currentUser});

  final String text;
  final String sender;
  final bool currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            currentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              sender,
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: kFontSourceSansPro,
                color: Colors.white54,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(minWidth: 30.0),
            decoration: BoxDecoration(
              color: currentUser ? Colors.lightBlueAccent : Colors.white,
              borderRadius: currentUser
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))
                  : BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                text ?? 'Text display error',
                style: TextStyle(
                    fontFamily: kFontSourceSansPro,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
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
          final messages = snapshot.data.docs.reversed;
          List<MessageContainer> messagesWidgets = [];
          for (var message in messages) {
            final messageText = message.data()['text'];
            final messageSender = message.data()['sender'];
            final currentUser = _loggedInUser.email;

            final messageWidget = MessageContainer(
              text: messageText,
              sender: messageSender,
              currentUser: currentUser == messageSender,
            );
            messagesWidgets.add(messageWidget);
          }
          return Expanded(
            child: ListView(
              reverse: true,
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
