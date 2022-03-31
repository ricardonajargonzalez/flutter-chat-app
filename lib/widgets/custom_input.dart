

import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  final IconData icon;
  final TextInputType textInputType;
  final bool isPassword;
  final String placeholder;
  final TextEditingController textController;

  const CustomInput({ 
    Key? key, 
    required this.icon, 
    this.textInputType = TextInputType.text, 
    this.isPassword  = false, 
    required this.placeholder, 
    required this.textController  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0,5),
                  blurRadius: 5
                )
              ]
            ),
            child: TextField(
              controller: this.textController,
              autocorrect: false,
              keyboardType: textInputType,
              obscureText: isPassword,
              decoration: InputDecoration(
                //icon: Icon(Icons.email_outlined),
                prefixIcon: Icon(this.icon),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: placeholder
              ),
            )
            );
  }
}