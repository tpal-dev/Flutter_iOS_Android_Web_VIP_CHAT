import 'package:flutter/material.dart';

const kFontSourceSansProRegular = 'SourceSansProRegular';
const kFontSourceSansProBold = 'SourceSansProBold';
const kFontBungeeShade = 'BungeeShade';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
  fontFamily: kFontSourceSansProBold,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kBodyBackgroundContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [Colors.blue, Colors.white, Colors.red]),
);

final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [Colors.pink, Colors.purpleAccent]),
  borderRadius: BorderRadius.circular(30.0),
);
