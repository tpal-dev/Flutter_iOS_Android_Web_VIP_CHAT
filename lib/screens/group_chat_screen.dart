import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vip_chat_app/services/auth.dart';
import 'package:vip_chat_app/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vip_chat_app/utilities/constantsFirebaseDB.dart';
import 'package:vip_chat_app/widgets/chat/message_text_field.dart';
import 'package:vip_chat_app/widgets/chat/messages_stream.dart';
import 'package:vip_chat_app/widgets/customized_animated_drawer.dart';

class GroupChatScreen extends StatefulWidget {
  static const String id = 'group_chat_screen';
  const GroupChatScreen({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  @override
  _GroupChatScreenState createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final TextEditingController _messageTextController = TextEditingController();
  User _loggedInUser;
  String _messageText = '';

  void initState() {
    super.initState();
    _loggedInUser = widget.auth.currentUser;
  }

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
    final userData = await FirebaseFirestore.instance
        .collection(CollectionUsers.id)
        .doc(_loggedInUser.uid)
        .get();
    FirebaseFirestore.instance.collection(CollectionGroupChat.id).add({
      CollectionGroupChat.text: _messageText,
      CollectionGroupChat.sender:
          _loggedInUser.displayName ?? userData[CollectionUsers.username],
      CollectionGroupChat.createdAt: Timestamp.now(),
      CollectionGroupChat.uid: _loggedInUser.uid,
      CollectionGroupChat.imageUrl: userData[CollectionUsers.imageUrl]
    });
    _messageTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return CustomizedAnimatedDrawer(
      authentication: widget.auth,
      homePageContent: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            leading: null,
            title: Text(
              '️GROUP CHAT',
              style: kAppBarTextStyle,
            ),
          ),
          body: SafeArea(
            child: Container(
              color: kBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  MessagesStream(
                    loggedInUser: _loggedInUser,
                  ),
                  MessageTextField(
                    onSend: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
