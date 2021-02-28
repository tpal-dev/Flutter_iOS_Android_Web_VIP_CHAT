import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomizedTextButton extends StatelessWidget {
  CustomizedTextButton(
      {@required this.title,
      @required this.onPressed,
      this.fontFamily,
      this.fontWeight,
      this.color,
      this.fontSize});

  final String title;
  final Function onPressed;
  final String fontFamily;
  final FontWeight fontWeight;
  final int fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      textStyle: TextStyle(
        color: (color != null) ? color : Colors.blue,
        fontFamily: fontFamily,
        fontWeight: (fontWeight != null) ? fontWeight : FontWeight.bold,
        fontSize: (fontSize != null) ? fontSize : 17,
      ),
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
