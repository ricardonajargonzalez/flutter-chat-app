import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;


  const ChatMessage({ 
    Key? key, 
    required this.texto, 
    required this.uid, 
    required this.animationController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition( //animacion
      opacity: animationController, //opacitynecesariio para la animacion
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController, curve: Curves.easeOut),
        child: Container(
          child: uid == '123'
          ? _myMessage()
          : _messageToMe()
        ),
      ),
    );
  }

  Widget _myMessage(){
     return Align(
      alignment: Alignment.centerRight,
      child: Container(
         margin: EdgeInsets.only(
           right: 3,
           bottom: 5,
           left: 50
         ),
        padding: EdgeInsets.all(8.0),
        child: Text(this.texto, style: TextStyle(color: Colors.black87)),
        decoration: BoxDecoration(
          color: Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(10)
        ),
        ),
    );
  }
  Widget _messageToMe(){
  return Align(
      alignment: Alignment.centerLeft,
      child: Container(
       //width: double.infinity,
        margin: EdgeInsets.only(
           right: 50,
           bottom: 5,
           left: 3
         ),
        padding: EdgeInsets.all(8.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(this.texto, style: TextStyle(color: Colors.black87))
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(10)
        ),
        ),
    );
  }
}