import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30.0),
      elevation: 10,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pink, Colors.purpleAccent]),
          borderRadius: BorderRadius.circular(30.0),
        ),
        constraints: BoxConstraints(minWidth: 300),
        child: TextButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {},
          child: Text(
            'Gradient Button',
          ),
        ),
      ),
    );
  }
}
