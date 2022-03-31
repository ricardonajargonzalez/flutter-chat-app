


import 'package:flutter/material.dart';

class BottonAzul extends StatelessWidget {
  final ButtonStyle raisedButtonStyle;
  final String text;
  final Function() onPress;
  const BottonAzul({ Key? key, required this.raisedButtonStyle, required this.text, required this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
              width: double.infinity,
              child: ElevatedButton(
                style: this.raisedButtonStyle,
                onPressed: this.onPress,
                child: Text(this.text),
              ));
  }
}